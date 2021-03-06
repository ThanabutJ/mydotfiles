"telescope
lua require("zoom")

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fof <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fp :lua require('telescope.builtin').git_files()<CR>

nnoremap <leader>pl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

nnoremap <leader>bf :lua require('telescope.builtin').buffers()<CR>

"lsp builtin
nnoremap <leader>ds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>dd <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>wd <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>

nnoremap <leader>pgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>pgc <cmd>lua require('telescope.builtin').git_branches()<cr>

nnoremap <leader>pts <cmd>lua require('telescope.builtin').treesitter()<cr>

nnoremap <leader>fdf :lua require('zoom.telescope').search_dotfiles()<CR>
nnoremap <leader>gpt :lua require('zoom.telescope').git_tag_selector()<CR>

"nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
"nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
"nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>

