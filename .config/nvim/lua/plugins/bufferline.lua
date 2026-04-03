return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {}
  end,
}
-- vim: ts=2 sts=2 sw=2 et
