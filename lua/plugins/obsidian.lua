require("which-key").register({
  ["<leader>o"] = {
    name = "+obsidian",
  },
})

vim.keymap.set("n", "gd", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gd"
  end
end, {
  expr = true,
  noremap = false,
})

local path_to_vaults = ""
if vim.fn.has("wsl") == 1 then
  path_to_vaults = "/mnt/c/Users/trist/ObsidianVaults/"
else
  path_to_vaults = "C:/Users/trist/ObsidianVaults/"
end
local DndVault = path_to_vaults .. "DndVault/"

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. path_to_vaults
      .. "/**.md",
    "BufNewFile " .. path_to_vaults .. "/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "DndVault",
        path = DndVault,
      },
    },

    follow_url_func = function(url)
      -- Open the url in a new tab
      if vim.fn.has("win32") == 1 then
        vim.fn.jobstart("cmd.exe /C start " .. url)
      else
        vim.fn.jobstart("xdg-open " .. url)
      end
    end,

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- see below for full list of options 👇
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New note" },
    { "<leader>of", "<cmd>ObsidianSearch<CR>", desc = "Find note" },
    { "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Templates" },
    { "<leader>ol", "<cmd>ObsidianLink<CR>", desc = "Link" },
    { "<leader>or", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
    { "<leader>od", "<cmd>ObsidianFollowLink<CR>", desc = "Follow link (goto)" },
  },
}
