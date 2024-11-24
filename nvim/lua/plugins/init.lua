return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
   "folke/which-key.nvim",
   event = "VeryLazy",
   opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
   },
   keys = {
     {
       "<leader>?",
       function()
         require("which-key").show({ global = false })
       end,
       desc = "Buffer Local Keymaps (which-key)",
     },
   },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 38,
        },
        renderer = {
          highlight_git = true,
          group_empty = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
      })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
    vim.cmd.colorscheme("nord")
    end,
  },
}
