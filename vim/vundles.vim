" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" Vundle plugin
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'ciaranm/detectindent'
Plugin 'pangloss/vim-javascript'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'altercation/vim-colors-solarized'

" Plugins setup
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q |

if executable('tidy5')
  let g:syntastic_html_tidy_exec = 'tidy5'
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
let g:ctrlp_cmd = 'CtrlP'

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_when_mixed = 1

let g:solarized_termcolors=256
syntax enable
set background=light
colorscheme solarized

autocmd BufRead * :DetectIndent

"Filetype plugin indent on is required by vundle
filetype plugin indent on
