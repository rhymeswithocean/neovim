return {
  {
    'smoka7/hop.nvim',
    version = '*',
    keys = {
      { 'f', '<cmd>HopChar1CurrentLineAC<CR>', mode = { 'n', 'v' }, desc = 'Hop: char forward on line' },
      { 'F', '<cmd>HopChar1CurrentLineBC<CR>', mode = { 'n', 'v' }, desc = 'Hop: char backward on line' },
      { 's', '<cmd>HopChar2<CR>',              mode = { 'n', 'v' }, desc = 'Hop: 2-char jump' },
      { 'S', '<cmd>HopWord<CR>',               mode = { 'n', 'v' }, desc = 'Hop: word jump' },
      { '<leader>j', '<cmd>HopLine<CR>',       mode = { 'n', 'v' }, desc = 'Hop: line jump' },
    },
    opts = {
      quit_key = '<Esc>',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
