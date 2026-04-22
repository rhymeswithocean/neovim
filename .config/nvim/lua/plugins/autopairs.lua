return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'", '<' },
        pattern = [=[[%'%"%>%]%)%}%,%.%s]]=],
        end_key = '$',
        before_key = 'h',
        after_key = 'l',
        cursor_before_pos = false,
        keys = 'qwertyuiopzxcvbnmasdfjkl',
        manual_position = true,
        highlight = 'Search',
        highlight_grey = 'Comment',
      },
    }
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
