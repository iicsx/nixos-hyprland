require("notify").setup({
  -- level = vim.log.levels.DEBUG,
  render = "compact",
  stages = "fade",
  timeout = 3000,
  top_down = false,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, {
      -- vim.cmd [[:TransparentEnable]]
    })
  end,
})
