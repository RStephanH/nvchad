-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gatekeeper",
  --transparency = true,


	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.nvdash = { load_on_startup = true }
M.ui = {
      tabufline = {
         lazyload = true
     }
}
M.ui = {
 statusline = {
   theme = "default",
   separator_style = "round",
 --   order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "xyz", "abc" },
 --   modules = {
 --     abc = function()
 --       return "hi"
 --     end,
 --
 --     xyz =  "hi",
 --     f = "%F"
 --   }
 },
}

return M
