local M = {
  servers = {
    cssls = { "css" },
    html  = { "html" },
    ty    = { "python" },
    godot = { "gdscript", "godot_resource", "gdshader" },
  },
  parsers = {
    "bash", "json", "yaml", "toml",
    "markdown", "markdown_inline",
  },
}

for _, ts in pairs(M.servers) do
  vim.list_extend(M.parsers, ts)
end

M.lsp_servers = vim.tbl_keys(M.servers)

function M.load_custom_configs()
  for name in pairs(M.servers) do
    pcall(require, "configs.lspconfigs." .. name)
  end
end

return M
