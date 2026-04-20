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
        filter = function(buf)
          local exclude = { mason = true, markdown = true }
          return exclude[vim.bo[buf].filetype]
        end,
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
          filter = function(buf)
            return vim.bo[buf].filetype ~= 'markdown'
          end,
          char = '│',
          underline = true,
        },
        chunk = {
          enabled = false,
          char = {
            corner_top    = '╭',
            corner_bottom = '╰',
            horizontal    = '─',
            vertical      = '│',
            arrow         = '›',
          },
        },
      },
      dashboard = {
        width = 60,
        sections = {
          {
            text = {
              { '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗\n', hl = 'SnacksDashboardHeader' },
              { '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║\n', hl = 'SnacksDashboardHeader' },
              { '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║\n', hl = 'SnacksDashboardHeader' },
              { '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║\n', hl = 'SnacksDashboardHeader' },
              { '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║\n', hl = 'SnacksDashboardHeader' },
              { '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝\n', hl = 'SnacksDashboardHeader' },
            },
            padding = 1,
          },
          {
            section = 'keys',
            gap = 1,
            padding = 1,
          },
          { section = 'startup' },
        },
        preset = {
          keys = {
            { icon = '󰈞 ', key = 'f', desc = 'Find File', action = ':lua Snacks.picker.files({ hidden = true, ignored = true })' },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ':lua Snacks.picker.recent()' },
            { icon = ' ', key = 'o', desc = 'File Manager', action = '<CMD>edit .<CR>' },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
            { icon = '󰏓 ', key = 'l', desc = 'Plugins', action = ':Lazy' },
            { icon = '󰅗 ', key = 'q', desc = 'Quit',action = ':qa' },
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
