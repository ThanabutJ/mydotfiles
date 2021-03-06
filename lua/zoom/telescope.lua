local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        color_devicons = true,
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },

        _previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        use_less = true,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
         override_file_sorter = true,
        }
    }
}

--require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')


local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/mydotfiles/",
    })
end

function push_git_tag_to_origin(tag)
    vim.fn.system(
        "git push origin " .. tag)
end

local function select_git_tag(prompt_bufnr, map)
    local function push_the_tag(close)
        local content = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        push_git_tag_to_origin(content.value)
        if close then
            require('telescope.actions').close(prompt_bufnr)
        end
    end

    map('i', '<C-o>', function()
        push_the_tag()
    end)

    map('i', '<CR>', function()
        push_the_tag(true)
    end)
end

local function git_tag_selector(prompt)
    return function()
        require("telescope.builtin").find_files({
            prompt_title = prompt,
            finder = function(find_command, opts)
                local files = {}
                local tmpfile = "/tmp/stmp.txt"
                os.execute('git tag -l > ' .. tmpfile )
                local f = io.open(tmpfile)
                if not f then return files end
                local k = 1
                for line in f:lines() do
                    files[k] = line
                    print(line)
                end
                f:close()
                print(files)

                return files
            end,

            attach_mapping = function(prompt_bufnr, map)
                select_git_tag(prompt_bufnr, map)

                return true
            end
        })
    end
end

M.git_tag_selector = git_tag_selector("< Push git tag >")

return M
