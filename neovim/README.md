This is my neovim configuration. 
- Run `python3 -m venv nvenv` to create a virtual env
- Run `pip3 install -r requirements` after activating the venv to install the required libraries for python dev env

Use this command to install the Plugin Manager for neovim

- `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

Copy the init.vm to `~/.config/nvim/init.vm`
