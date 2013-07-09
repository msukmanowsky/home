### Install required stuff ####################################################
export VIMHOME=~/.vim

mkdir -p $VIMHOME/bundle $VIMHOME/autoload

# Install pathogen
mkdir -p $VIMHOME/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
     https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

# vim-fugitive
cd $VIMHOME/bundle
git clone https://github.com/tpope/vim-fugitive.git

# python folding
mkdir -p $VIMHOME/bundle/ftplugin
wget -O $VIMHOME/bundle/ftplugin/python_editing.vim \
     http://www.vim.org/scripts/download_script.php?src_id=5492

# wombat256mod
mkdir -p $VIMHOME/colors
cd $VIMHOME/colors
wget -O wombat256mod.vim \
     http://www.vim.org/scripts/download_script.php?src_id=13400

# jedi-vim
cd $VIMHOME/bundle
git clone git://github.com/davidhalter/jedi-vim.git
cd jedi-vim
git submodule update --init
pip install vim-bridge

# ctrl-p
cd $VIMHOME/bundle
git clone https://github.com/kien/ctrlp.vim.git

# vim-powerline
cd $VIMHOME/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

# NERDtree
cd $VIMHOME/bundle
git clone https://github.com/scrooloose/nerdtree.git

# vim-flake8
pip install flake8


# Create symlinks in ~/ #######################################################
ln -s .vimrc ~/.vimrc
# ln -s .bash_profile ~/.bash_profile


