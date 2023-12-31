-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local deletemap = vim.keymap.del
local keymap = vim.keymap.set

deletemap("n", "<leader>|")
deletemap("n", "<leader>-")
deletemap("n", "<leader>w|")
deletemap("n", "<leader>w-")
deletemap("n", "<leader>ww")
deletemap("n", "<leader>wd")
deletemap("n", "<leader>ft")
deletemap("n", "<leader>l")

-- Escape
keymap("i", "jk", "<Esc>", { desc = "Escape" })

-- Manage Splits
keymap("n", "ss", ":split<CR>", { desc = "Split horizontal" })
keymap("n", "sv", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "sq", "<C-W>c", { desc = "Close split" })

-- Lazy
keymap("n", "<leader>p", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Better scrolling
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })

-- Terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
keymap("n", "<C-\\>", lazyterm, { desc = "Terminal (root dir)" })
keymap("n", "<leader><C-\\>", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })

-- Buffer

keymap("i", "<C-r>f", '<C-r>=expand("%:t:r")<CR>', { desc = "Paste only filename" })

-- Remap lsp keys

deletemap("n", "<leader>cf")
deletemap("n", "<leader>cF")
deletemap("n", "<leader>cd")
deletemap("n", "<leader>cm")

keymap({ "n", "v" }, "<leader>lf", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

keymap("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "<leader>lj", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "<leader>lk", diagnostic_goto(false), { desc = "Prev Diagnostic" })

keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
keymap("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Mason" })
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
