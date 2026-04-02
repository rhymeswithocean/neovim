return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      scroll = { enabled = true },
      notifier = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = true,
          style = 'out',
          easing = 'linear',
          duration = {
            step = 10,
            total = 100,
          },
        },
        scope = {
          enabled = true,
          char = '│',
          underline = true,
        },
        chunk = {
          enabled = true,
          char = {
            corner_top    = '╭',
            corner_bottom = '╰',
            horizontal    = '─',
            vertical      = '│',
            arrow         = '›',
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
