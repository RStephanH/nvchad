vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = true,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.lsp.enable('markdown_oxide')

local nvim_lsp = require'lspconfig'

-- configuration for a language server ( bashls for Bash)
nvim_lsp.bashls.setup{}


--Set up pyright for Python
nvim_lsp.pyright.setup{
  setting = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "on"
      }
    }
  }
}
-- You can add more language servers here
nvim_lsp.ts_ls.setup{} -- For TypeScript
-- Set up the HTML language server

-- nvim_lsp.html.setup{
--   cmd = { "html-languageserver", "--stdio" },
--   filetypes = { "html" },
--   init_options = {
--     configurationSection = { "html", "css", "javascript" },
--     embeddedLanguages = {
--       css = true,
--       javascript = true
--     }
--   }
-- }
nvim_lsp.intelephense.setup{
}

