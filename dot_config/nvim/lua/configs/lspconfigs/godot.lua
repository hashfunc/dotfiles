local port = tonumber(os.getenv("GDScript_Port")) or 6005
local pipe = vim.fn.expand("~/.tmp/godot.pipe")
local pipe_dir = vim.fn.fnamemodify(pipe, ":h")

vim.fn.mkdir(pipe_dir, "p")

vim.lsp.config("godot", {
  cmd = vim.lsp.rpc.connect("127.0.0.1", port),
  filetypes = { "gdscript" },
  root_markers = { "project.godot", ".git" },
  on_attach = function()
    vim.fn.serverstart(pipe)
  end,
})
