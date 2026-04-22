return {
  "dstein64/nvim-scrollview",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    current_only = false,
    signs_on_startup = { "search", "cursor" },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "notify",
      "lazy",
      "mason",
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
