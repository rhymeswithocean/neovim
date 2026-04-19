return {
  {
    'neovim-treesitter/nvim-treesitter',
    branch = "main",
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      { 'neovim-treesitter/treesitter-parser-registry' },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        config = function()
          require('nvim-treesitter-textobjects').setup {
            move = { set_jumps = true },
          }
          local move = require('nvim-treesitter-textobjects.move')
          local opts = { noremap = true, silent = true }
          local keymaps = {
            { ']]', function() move.goto_next_start('@function.outer', 'textobjects') end },
            { ']m', function() move.goto_next_start('@function.outer', 'textobjects') end },
            { ']o', function() move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end },
            { ']s', function() move.goto_next_start('@local.scope', 'locals') end },
            { ']z', function() move.goto_next_start('@fold', 'folds') end },
            { ']M', function() move.goto_next_end('@function.outer', 'textobjects') end },
            { '][', function() move.goto_next_end('@class.outer', 'textobjects') end },
            { '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end },
            { '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end },
            { '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end },
            { '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end },
            { ']d', function() move.goto_next('@conditional.outer', 'textobjects') end },
            { '[d', function() move.goto_previous('@conditional.outer', 'textobjects') end },
          }
          for _, km in ipairs(keymaps) do
            vim.keymap.set({ 'n', 'x', 'o' }, km[1], km[2], opts)
          end
        end,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
    opts = {
      ensure_installed = {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
