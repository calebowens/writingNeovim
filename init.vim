" VimPlug stuff

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'sainnhe/everforest'
Plug 'jceb/vim-orgmode'

call plug#end()

" Theme
colorscheme everforest

" Configure telescope
nnoremap ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Limelight Configurations
nmap <Leader>l <Plug>(Limelight)

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Add jumping to \"headers\"
function GotoHeader()
  let currentLine = getline(".")

  let oldPosition = getcurpos()

  call cursor(1, 1)

  echo currentLine

  let [lpos, cpos] = searchpos("+" . currentLine, '')

  echo cpos

  if cpos == 0
    call setpos(".", oldPosition)
  else
    call cursor(lpos, cpos)
  endif
endfunction

nnoremap gh <esc>:call GotoHeader()<cr><cr>
