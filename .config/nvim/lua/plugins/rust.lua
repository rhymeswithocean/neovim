return {
  { 'rust-lang/rust.vim', ft = 'rust' },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = 'rust',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'rust',
        callback = function(event)
          local bufnr = event.buf
          vim.keymap.set('n', '<leader>a', function()
            vim.cmd.RustLsp 'codeAction'
          end, { silent = true, buffer = bufnr, desc = 'Rust code action' })
          vim.keymap.set('n', 'K', function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end, { silent = true, buffer = bufnr, desc = 'Rust hover actions' })
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
