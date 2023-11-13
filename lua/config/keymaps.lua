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

-- Terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
keymap("n", "<C-\\>", lazyterm, { desc = "Terminal (root dir)" })
keymap("n", "<leader><C-\\>", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })
