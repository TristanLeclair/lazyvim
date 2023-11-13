return {
  "oflisback/obsidian-bridge.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("obsidian-bridge").setup({
      obsidian_server_address = "https://localhost:27124",
      scroll_sync = true,
    })
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  lazy = true,
}
