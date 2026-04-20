return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/treesitter-parser-registry' },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        config = function()
          require('nvim-treesitter-textobjects').setup()

          local select = require('nvim-treesitter-textobjects.select')
          local move   = require('nvim-treesitter-textobjects.move')
          local repeat_move = require('nvim-treesitter-textobjects.repeatable_move')
          local opts = { noremap = true, silent = true }

          -- Guard: check if a treesitter query group is available for the current buffer
          local function can_move(query_group)
            local ok, parser = pcall(vim.treesitter.get_parser, 0)
            if not ok or not parser then return false end
            local lang = parser:lang()
            return pcall(vim.treesitter.query.get, lang, query_group)
          end

          local function safe_move(query, group, fn)
            return function()
              if not can_move(group) then return end
              pcall(fn, query, group)
            end
          end

          -- Select textobjects (x/o modes) -- from README
          local select_maps = {
            { 'am', '@function.outer', 'textobjects' },
            { 'im', '@function.inner', 'textobjects' },
            { 'ac', '@class.outer',    'textobjects' },
            { 'ic', '@class.inner',    'textobjects' },
            { 'as', '@local.scope',    'locals'      },
          }
          for _, km in ipairs(select_maps) do
            vim.keymap.set({ 'x', 'o' }, km[1], function()
              select.select_textobject(km[2], km[3])
            end, opts)
          end

          -- Move keymaps (n/x/o modes)
          local move_maps = {
            { ']]', move.goto_next_start,     '@function.outer',                      'textobjects' },
            { ']m', move.goto_next_start,     '@function.outer',                      'textobjects' },
            { ']o', move.goto_next_start,     { '@loop.inner', '@loop.outer' },        'textobjects' },
            { ']s', move.goto_next_start,     '@local.scope',                         'locals'      },
            { ']z', move.goto_next_start,     '@fold',                                'folds'       },
            { ']M', move.goto_next_end,       '@function.outer',                      'textobjects' },
            { '][', move.goto_next_end,       '@class.outer',                         'textobjects' },
            { '[[', move.goto_previous_start, '@function.outer',                      'textobjects' },
            { '[m', move.goto_previous_start, '@function.outer',                      'textobjects' },
            { '[M', move.goto_previous_end,   '@function.outer',                      'textobjects' },
            { '[]', move.goto_previous_end,   '@class.outer',                         'textobjects' },
            { ']d', move.goto_next,           '@conditional.outer',                   'textobjects' },
            { '[d', move.goto_previous,       '@conditional.outer',                   'textobjects' },
          }
          for _, km in ipairs(move_maps) do
            local fn, query, group = km[2], km[3], km[4]
            vim.keymap.set({ 'n', 'x', 'o' }, km[1], safe_move(query, group, fn), opts)
          end

          -- Repeatable move: ; and , repeat last ts move (vim-style)
          vim.keymap.set({ 'n', 'x', 'o' }, ';', repeat_move.repeat_last_move, opts)
          vim.keymap.set({ 'n', 'x', 'o' }, ',', repeat_move.repeat_last_move_opposite, opts)

          -- Make built-in f/F/t/T repeatable with ; and , as well
          vim.keymap.set({ 'n', 'x', 'o' }, 'f', repeat_move.builtin_f_expr, { expr = true })
          vim.keymap.set({ 'n', 'x', 'o' }, 'F', repeat_move.builtin_F_expr, { expr = true })
          vim.keymap.set({ 'n', 'x', 'o' }, 't', repeat_move.builtin_t_expr, { expr = true })
          vim.keymap.set({ 'n', 'x', 'o' }, 'T', repeat_move.builtin_T_expr, { expr = true })
        end,
      },
    },
    opts = {
      ensure_installed = {
        'bash', 'c', 'cpp', 'diff', 'html', 'html_tags', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
      },
      auto_install = true,
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
      require('nvim-treesitter').install(opts.ensure_installed)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
