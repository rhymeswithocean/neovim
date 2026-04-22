return {
  "dstein64/nvim-scrollview",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    current_only = false,
    signs_on_startup = { "diagnostics", "search", "marks", "cursor", "gitsigns" },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "notify",
      "lazy",
      "mason",
    },
  },
  config = function(_, opts)
    require("scrollview").setup(opts)
    -- gitsigns contrib integration
    require("scrollview.contrib.gitsigns")
  end,
}

-- vim: ts=2 sts=2 sw=2 et
