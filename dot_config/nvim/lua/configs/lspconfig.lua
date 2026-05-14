require("nvchad.configs.lspconfig").defaults()

local lang = require "configs.languages"
lang.load_custom_configs()
vim.lsp.enable(lang.lsp_servers)
