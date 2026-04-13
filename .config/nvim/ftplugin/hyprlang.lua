vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*/hypr/*.conf', 'hyprland.conf' },
  callback = function()
    vim.bo.filetype = 'hyprlang'
  end,
})
