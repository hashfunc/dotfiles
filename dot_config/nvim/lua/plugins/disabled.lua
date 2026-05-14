-- Plugins disabled from NvChad's bundled spec.
-- Add a plugin name (e.g. "author/repo") to opt out.
local disabled = {
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "saadparwaiz1/cmp_luasnip",
}

return vim.tbl_map(function(name)
  return { name, enabled = false }
end, disabled)
