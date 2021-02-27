"Plugin List"
call plug#begin(stdpath('data').'/plugged')
  " Gruvbox colour scheme
  Plug 'morhetz/gruvbox'

  " Custom bar at the bottom
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Inserts indent lines
  Plug 'Yggdroot/indentLine'
  
  " NERDtree for file navigation
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Code autocompletion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Extra color highlighting for C++
  "Plug 'octol/vim-cpp-enhanced-highlight'

  " Markdown support
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'junegunn/goyo.vim'

  " VimWiki
  Plug 'vimwiki/vimwiki'

  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

" filetype plugin indent on
filetype plugin on

let mapleader=" "

" Setting colour scheme and bottom bar style
let g:airline_theme='luna'
syntax on
colorscheme gruvbox
set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set nowrap
set colorcolumn=79

set cmdheight=2
set updatetime=300
set signcolumn=yes

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Use system clipboard
set clipboard+=unnamedplus

" FZF
nmap <leader>F :FZF<CR>


" Assembler
autocmd FileType asm set noexpandtab

" JSON
autocmd FileType json let g:indentLine_enabled=0
"autocmd FileType json let g:vim_markdown_conceal = 0
autocmd FileType json set concealcursor-=n

" Haskell
"autocmd FileType haskell let g:haskel

" Markdown====================================================================
"let g:vim_markdown_conceal = 0
"autocmd FileType markdown let g:vim_markdown_conceal = 0
"autocmd FileType markdown set conceallevel=0
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType markdown set nofoldenable
autocmd FileType markdown set conceallevel=2
autocmd FileType markdown set concealcursor-=in
autocmd FileType markdown set spelllang=en_gb
autocmd FileType markdown set spellfile=$HOME/OneDrive-MUNI/vim/spell/gb.utf-8.add
"autocmd FileType markdown normal zR
"autocmd FileType markdown let g:vim_markdown_folding_disabled = 1

" VimWiki
let g:vimwiki_list = [{'path': '~/OneDrive-MUNI/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'

map <leader>md :MarkdownPreview


" NERDtree====================================================================
map <C-n> :NERDTreeToggle<CR>


" CoC=========================================================================
" Stuff from coc repo
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' <F3>to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Or use `complete_info` if your vim support it, like:
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

"" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

"" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

"" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Using CocList
"" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

