return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      modules = {},
      sync_install = false,
      ignore_install = {},
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        move = { set_jumps = true },
      }

      local move = require('nvim-treesitter-textobjects.move')
      local opts = { noremap = true, silent = true }

      local keymaps = {
        -- next start
        { ']]', function() move.goto_next_start('@function.outer', 'textobjects') end },
        { ']m', function() move.goto_next_start('@function.outer', 'textobjects') end },
        { ']o', function() move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end },
        { ']s', function() move.goto_next_start('@local.scope', 'locals') end },
        { ']z', function() move.goto_next_start('@fold', 'folds') end },
        -- next end
        { ']M', function() move.goto_next_end('@function.outer', 'textobjects') end },
        { '][', function() move.goto_next_end('@class.outer', 'textobjects') end },
        -- previous start
        { '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end },
        { '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end },
        -- previous end
        { '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end },
        { '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end },
        -- nearest
        { ']d', function() move.goto_next('@conditional.outer', 'textobjects') end },
        { '[d', function() move.goto_previous('@conditional.outer', 'textobjects') end },
      }

      for _, km in ipairs(keymaps) do
        vim.keymap.set({ 'n', 'x', 'o' }, km[1], km[2], opts)
      end
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
