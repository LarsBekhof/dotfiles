# Pathogen install
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ctrlp install
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# auto-pairs install
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

# powerline install
git clone https://github.com/powerline/powerline.git ~/.vim/bundle/powerline

# syntastic install
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

# typescript-vim install
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim

# vim-js-pretty-template install
git clone https://github.com/Quramy/vim-js-pretty-template.git ~/.vim/bundle/vim-js-pretty-template

# vim-commentray install
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

# vim-blade install
git clone git://github.com/jwalton512/vim-blade.git ~/.vim/bundle/vim-blade
