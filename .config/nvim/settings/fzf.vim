" FZF
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif

let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

  if executable('rg')
    " :Find <term> runs `rg <term>` and passes it to fzf
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
    nnoremap <leader>/ :Find
    nnoremap <leader>' :execute "Find " . expand("<cword>")<cr>
  endif
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

" Use FZF for files and tags if available, otherwise fall back onto CtrlP
" <leader>j will search for tag using word under cursor
let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif
