local map = vim.keymap.set

local animate = require("mini.animate")

local timing = animate.gen_timing.cubic({
  easing = "out",
  duration = 50,
  unit = "total",
})

local path = animate.gen_path.line({
  predicate = function(destination)
    return destination[1] ~= 0 or destination[2] ~= 0
  end,
})

animate.setup({
  cursor = { enable = true, timing = timing, path = path },
  scroll = { enable = true, timing = timing },
  resize = { enable = false },
  open   = { enable = false },
  close  = { enable = false },
})

require("mini.ai").setup()

require("mini.surround").setup()

require("mini.completion").setup()

local snippets = require("mini.snippets")
snippets.setup({
  snippets = { snippets.gen_loader.from_lang() },
})

local keymap = require("mini.keymap")
keymap.setup()
keymap.map_multistep("i", "<Tab>",   { "minisnippets_next", "minisnippets_expand", "pmenu_next" })
keymap.map_multistep("i", "<S-Tab>", { "minisnippets_prev", "pmenu_prev" })
keymap.map_multistep("i", "<CR>",    { "pmenu_accept" })

require("mini.git").setup()
map("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "Git status" })
map("n", "<leader>gl", "<cmd>Git log --oneline -n 20<CR>", { desc = "Git log" })
map("n", "<leader>gb", "<cmd>vertical Git blame -- %<CR>", { desc = "Git blame (current file)" })
map({ "n", "x" }, "<leader>gh", function() MiniGit.show_at_cursor() end, { desc = "Git show at cursor" })
map("x", "<leader>gH", function() MiniGit.show_range_history() end, { desc = "Git range history" })

require("mini.diff").setup()
map("n", "<leader>go", function() MiniDiff.toggle_overlay() end, { desc = "Diff overlay toggle" })

local indentscope = require("mini.indentscope")
indentscope.setup({
  symbol = "▏",
  draw = { animation = indentscope.gen_animation.none() },
  options = { border = "top" },
})

local function set_indentscope_hl()
  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "Comment" })
end
set_indentscope_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("UserMiniIndentscopeHL", { clear = true }),
  callback = set_indentscope_hl,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserMiniIndentscopeDisable", { clear = true }),
  pattern = {
    "help", "lazy", "mason", "nvcheatsheet", "nvdash",
    "nvimtree", "TelescopePrompt", "checkhealth",
  },
  callback = function() vim.b.miniindentscope_disable = true end,
})
