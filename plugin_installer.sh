# based on https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # downloads plugin manager
touch ~/.vim/plugins.vim # creates a list of plugins for vundle

cat >> ~/.vim/plugins.vim <<EOF
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'danro/rename.vim'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'lervag/vimtex'

call vundle#end()

filetype plugin indent on

EOF

pip3 install --user powerline-status
pip install --user powerline-status

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf


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
syntax on
EOF
