return {
  --############################################################################
  -- Telescope : fzf integrated
  --############################################################################
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find file in directory" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "search text in file in directory" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "list of buffer" })
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "list of past yank" })
        vim.keymap.set('n', '<leader>fo', builtin.old_files, { desc = "list of recently opened files" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end
  },

  --############################################################################
  -- File navigation menu on side
  --############################################################################
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      --"3rd/image.nvim"
    },
    config = function()
      vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal right toggle dir=%:p:h<CR>', {})
    end
  },

  --############################################################################
  -- opened buffer bar on top
  --############################################################################
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        separator_style = "slant",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      },
    },
  },
}
