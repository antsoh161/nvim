  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  pip install pynvim
  npm i -g neovim
  sudo apt install ripgrep
  ```

## Keymaps
Most keymaps are set in user/keymaps.lua

Some keymaps are required to be set in setup with an on_attach function, these includes:
user/lsp/handlers.lua
user/toggleterm/toggleterm.lua -- Only keys when terminal in toggled
user/nvim.tree.lua -- Only keymaps when nvim-tree is focused
