return {
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = function(_, opts)
      opts.cmdline = nil -- ⛔ remove cmdline entirely
      opts.sources = opts.sources or {}
    end,
  },
}
