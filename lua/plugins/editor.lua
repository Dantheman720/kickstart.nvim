return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'tpope/vim-surround',
    event = 'VeryLazy',
  },

  {
    'phaazon/hop.nvim',
    version = 'v2.*', -- recommended version
    opts = {},
    keys = {
      -- Hop to any character
      {
        'HC',
        function()
          require('hop').hint_char1()
        end,
        mode = { 'n', 'v', 'o' },
        desc = 'Hop to character',
      },

      -- Hop to any word
      {
        'HH',
        function()
          require('hop').hint_words()
        end,
        mode = { 'n', 'v', 'o' },
        desc = 'Hop to word',
      },

      -- Hop to any line
      {
        '<leader>l',
        function()
          require('hop').hint_lines()
        end,
        mode = { 'n', 'v', 'o' },
        desc = 'Hop to line',
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any C-like comment marker
      -- for <leader>c<space> or <leader>c<cr>
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      -- enable keybindings
      mappings = {
        -- operator-pending mapping
        basic = true,
        -- extra mapping
        extra = true,
      },
    },
    lazy = false,
  },

  {
    'ojroques/nvim-osc52',
    config = function()
      local osc52 = require 'osc52'

      -- Use OSC52 for all yanks
      vim.api.nvim_set_option('clipboard', 'unnamedplus')
      vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
          if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
            osc52.copy_register ''
          end
        end,
      })

      -- Optional: keymaps for manual copy
      vim.keymap.set('n', '<leader>c', osc52.copy_operator, { expr = true })
      vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
      vim.keymap.set('v', '<leader>c', osc52.copy_visual)
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
