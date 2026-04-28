return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'FzfLua',
  opts = {},
  keys = {
  { '<leader>fh',       function() require('fzf-lua').help_tags() end,                                              desc = '[F]ind [H]elp' },
  { '<leader>fk',       function() require('fzf-lua').keymaps() end,                                                desc = '[F]ind [K]eymaps' },
  { '<leader>ff',       function() require('fzf-lua').files() end,                                                   desc = '[F]ind [F]iles' },
  { '<leader>fs',       function() require('fzf-lua').builtin() end,                                                 desc = '[F]ind [S]elect fzf-lua' },
  { '<leader>fw',       function() require('fzf-lua').grep_cword() end,                                              desc = '[F]ind current [W]ord' },
  { '<leader>fg',       function() require('fzf-lua').live_grep() end,                                               desc = '[F]ind by [G]rep' },
  { '<leader>fd',       function() require('fzf-lua').diagnostics_document() end,                                    desc = '[F]ind [D]iagnostics' },
  { '<leader>fr',       function() require('fzf-lua').resume() end,                                                  desc = '[F]ind [R]esume' },
  { '<leader>f.',       function() require('fzf-lua').oldfiles() end,                                                desc = '[F]ind Recent Files' },
  { '<leader><leader>', function() require('fzf-lua').buffers() end,                                                 desc = 'Find existing buffers' },
  { '<leader>/',        function() require('fzf-lua').blines({ winopts = { height = 0.4, preview = { hidden = 'hidden' } } }) end, desc = 'Fuzzily search in current buffer' },
  { '<leader>f/',       function() require('fzf-lua').live_grep({ grep_open_files = true, prompt = 'Live Grep in Open Files❯ ' }) end, desc = '[F]ind [/] in Open Files' },
  { '<leader>fn',       function() require('fzf-lua').files({ cwd = vim.fn.stdpath('config') }) end,                desc = '[F]ind [N]eovim files' },
},
}
-- vim: ts=2 sts=2 sw=2 et
