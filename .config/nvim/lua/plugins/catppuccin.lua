return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'macchiato',
      integrations = {
        rainbow_delimiters = true,
        treesitter = true,
        noice = true,
        snacks =true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd 'colorscheme catppuccin-macchiato'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
