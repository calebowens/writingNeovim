sudo apt purge vim -y

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt install neovim -y

sudo ln -s /usr/bin/nvim /usr/bin/vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

new-item -ItemType Directory -Force -Path ~\.config\nvim\

cp ./init.vim ~/.config/nvim/

vim +'PlugInstall --sync' +qa

write-output "All done"
