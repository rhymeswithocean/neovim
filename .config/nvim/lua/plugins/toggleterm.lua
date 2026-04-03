return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        auto_scroll = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
        winbar = {
          enabled = true,
          name_formatter = function(term)
            return term.name or term.id
          end,
        },
      })

      -- Terminal window navigation (recommended by README)
      -- Uses wincmd as required when persist_mode = true
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk",   [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-t>", "<cmd>TermNew<CR>", opts)
        vim.keymap.set("t", "<C-w>", "<cmd>close<CR>", opts)
      end

      vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
      
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        hidden = true,
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      -- Cycle layout
      local layouts = { "float", "horizontal", "vertical", "tab" }
      local layout_idx = 1
      vim.keymap.set("n", "<leader>al", function()
        layout_idx = (layout_idx % #layouts) + 1
        local dir = layouts[layout_idx]
        require("toggleterm").setup({ direction = dir })
        vim.notify("Terminal: " .. dir)
      end, { desc = "Terminal: cycle layout" })

      -- New terminal / select terminal
      vim.keymap.set("n", "<leader>an", "<cmd>TermNew<CR>",    { desc = "Terminal: new" })
      vim.keymap.set("n", "<leader>as", "<cmd>TermSelect<CR>", { desc = "Terminal: select" })

      vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, { desc = "Toggle lazygit" })
    end,
  },
}
