return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("refactoring").setup({})
  end,
  keys = {
    { "<leader>re", ":Refactor extract", desc = { "Extract" } },
    { "<leader>rf", ":Refactor extract_to_file", desc = { "Extract to file" } },
    { "<leader>rv", ":Refactor extract_var", desc = { "Extract to variable" } },
    { "<leader>ri", ":Refactor inline_var", mode = { "n", "x" }, desc = { "Inline variable" } },
    { "<leader>rI", ":Refactor inline_func", desc = { "Inline function" } },
    { "<leader>rb", ":Refactor extract_block", desc = { "Extract block" } },
    { "<leader>rbf", ":Refactor extract_block_to_file", desc = { "Extract block to file" } },
    {
      "<leader>rr",
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      mode = { "n", "x" },
      desc = { "Open refactor menu" },
    },
  },
}
