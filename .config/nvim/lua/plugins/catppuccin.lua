return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
      integrations = {
        rainbow_delimiters = true,
        treesitter = true,
        noice = true,
        snacks =true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd 'colorscheme catppuccin-mocha'
      vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = '#c6a0f6' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
