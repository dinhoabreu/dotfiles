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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Plugin 'ciaranm/detectindent'
Plugin 'pangloss/vim-javascript'
"Plugin 'michaeljsmith/vim-indent-object'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'
Plugin 'restore_view.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'taglist.vim'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'bufkill.vim'
Plugin 'sql.vim--Stinson'
Plugin 'Align'
Plugin 'SQLUtilities' " <shift>V \sf
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tpope/vim-abolish'

" Bash support
" ERROR:
" Mapping already in use: "<LocalLeader>sf", mode "n"
" Mapping already in use: "<LocalLeader>sf", mode "v"
" Plugin 'bash-support.vim'

" Plugins setup
if executable('tidy5')
  let g:syntastic_html_tidy_exec = 'tidy5'
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 2

let g:Powerline_symbols = 'fancy'

let g:snipMate = {}
let g:snipMate.snippet_version = 1

let g:ctrlp_cmd = 'CtrlP'

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_when_mixed = 1

" let g:solarized_termcolors=256
let g:solarized_contrast = 'normal'
let g:solarized_visibility = 'low'

" let g:indentLine_char = '︙'
let g:indentLine_noConcealCursor = ''

let g:easytags_async = 1
" [SQL Style Guide](http://www.sqlstyle.guide/) align, indent and better syntax
let g:sqlutil_align_comma = 1
let g:sqlutil_use_syntax_support = 0
let g:sqlutil_align_where = 0
let g:sqlutil_keyword_case = '\L'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
let s:pink = "CB6F6F"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['sass'] = s:pink " sets the color of css files to blue

" Depends plugin 'ciaranm/detectindent'
" autocmd BufRead * :DetectIndent

" autocmd BufRead * :EditorConfigReload

"Filetype plugin indent on is required by vundle
filetype plugin indent on
