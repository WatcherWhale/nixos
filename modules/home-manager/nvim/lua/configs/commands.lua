vim.cmd([[command Nos :call histdel('/') | :noh]])

-- Git Aliases
vim.cmd([[command! Push Git push -o merge_request.create ]])
vim.cmd([[command! Pull Git pull ]])
vim.cmd([[command! NpmSync !npm i ]])
vim.cmd([[command! Npm call jobstart('npm i') ]])

vim.cmd([[command! W w ]])
vim.cmd([[command! Wq wq ]])

-- Autobuffer
vim.cmd([[autocmd FileType nix setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd filetype json setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd filetype json5 setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd FileType cue setlocal ts=2 sts=2 sw=2 expandtab]])
vim.cmd([[autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab]])

vim.cmd([[autocmd FileType terraform command! Fmt :%!terraform fmt - ]])

vim.cmd([[au BufNewFile,BufRead,BufWrite *.tf set filetype=terraform]])
-- vim.cmd([[au BufNewFile,BufRead,BufWrite *.tfvars set filetype=terraform]])
vim.cmd([[au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4]])
