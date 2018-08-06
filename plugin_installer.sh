# based on https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # downloads plugin manager
touch ~/.vim/plugins.vim # creates a list of plugins for vundle
# add TODO highlighting, indentlines, proper color scheme - latex vs c
# youcompleteme works with fedora only at the moment. defaut guide is not so good.
# cd ~
# mkdir ycm_build
# cd ycm_build
# cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON -DUSE_SYSTEM_BOOST=ON -DUSE_CLANG_TIDY=ON . ~/.vim/bundle/youcompleteme/third_party/ycmd/cpp
# need to fix tex conceal issues: strange fonts? 
# need to fix font issues: no symbols for powerline, nerdtree looks terrible
# need to fix spellchecking: do not have at all

cat >> ~/.vim/plugins.vim <<EOF

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'				" plugin manager

Plugin 'scrooloose/nerdtree'				" file manager tree

Plugin 'danro/rename.vim'					" rename current file

Plugin 'editorconfig/editorconfig-vim'		" configure editor rules

Plugin 'airblade/vim-gitgutter'				" shows git difference

Plugin 'vim-airline/vim-airline'			" customizeable vim status line
Plugin 'vim-airline/vim-airline-themes'		" themes

Plugin 'dracula/vim'						" dark color themes
Plugin 'blueshirts/darcula'					" 
Plugin 'altercation/vim-colors-solarized'	"

Plugin 'Yggdroot/indentLine'				" shows vertical indent lines

Plugin 'raimondi/delimitmate'				" autocomplition of parenthesis

Plugin 'ehamberg/vim-cute-python'			" uses conceal to replace some symbols

Plugin 'valloric/youcompleteme'				" autocomplete c & python

Plugin 'ryanoasis/vim-devicons'				" adds dev icons 

Plugin 'lervag/vimtex'						" tex features
Plugin 'keitanakamura/tex-conceal.vim'		" not tested; conceal doesn't work properly
Plugin 'donraphaco/neotex'					" pdf preview while editing + latexdiff

call vundle#end()

filetype plugin indent on

EOF

pip3 install --user --upgrade powerline-status
pip install --user --upgrade powerline-status

#cd ~/.fonts/
#wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
#fc-cache -vf ~/.fonts/

#mkdir ~/.config/fontconfig
#mkdir ~/.config/fontconfig/conf.d/

#cd ~/.config/fontconfig/conf.d/
#wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf


cat >> ~/.vimrc<<EOF
so ~/.vim/plugins.vim

" nerdtree section
" open a NERDTree automatically
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" CTRL+n
map <C-n> :NERDTreeToggle<CR>
" nerdtree section

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
syntax on
color dracula
" Invisible character colors - temp measure to try later, work for gvim
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set list
 "set listchars=eol:⏎,tab:␉·,trail:␠,extends:❯,precedes:❮,nbsp:⎵,space:·
set listchars=eol:¬,tab:␉·,trail:␠,extends:❯,precedes:❮,nbsp:⎵,space:·
 "set listchars=tab:>-,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:⎵,space:·
 
let g:neotex_enabled = 2
let g:neotex_latexdiff = 0
let g:tex_flavor = 'latex'

set exrc
set secure
EOF

mkdir  ~/.vim/ftplugin/
cat >> ~/.vim/ftplugin/c.vim <<EOF
setlocal tabstop=4
setlocal softtabstop=0 noexpandtab
setlocal shiftwidth=4
EOF

cat >> ~/.vim/ftplugin/python.vim <<EOF
setlocal tabstop=4
setlocal softtabstop=0 noexpandtab
setlocal shiftwidth=4
setlocal textwidth=80
EOF
#mkdir -p ~/.local/share/fonts 
#cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

#wget -O ~/fonts.zip https://github.com/ryanoasis/nerd-fonts/zipball/master
