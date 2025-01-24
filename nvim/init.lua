
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Plugin configuration
Plug('junegunn/seoul256.vim')

-- Git URL for plugin
Plug('https://github.com/junegunn/vim-easy-align.git')

-- Tagged release
Plug('fatih/vim-go', { ['tag'] = '*' })

-- Non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '$HOME/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '$HOME/.fzf', ['do'] = './install --all' })

-- Post-update hook with lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- Subdirectory plugin path
Plug('nsf/gocode', { ['rtp'] = 'vim' })

-- On-demand loading by command
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

-- On-demand loading by file type
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })

-- Unmanaged plugin
Plug('~/my-prototype-plugin')
Plug ('ThePrimeagen/vim-be-good')
vim.call('plug#end')

-- Load color schemes after plug#end()
vim.cmd('silent! colorscheme seoul256')

-- Setup lazy.nvim configuration
require("vim-options")
require("lazy").setup("plugins")
