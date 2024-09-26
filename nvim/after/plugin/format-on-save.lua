local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    "/.git/",
    "/.github/",
    "/.dist/"
  },
  formatter_by_ft = {
    typescript = formatters.prettierd,
    javascript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    javascriptreact = formatters.prettierd,
    json = formatters.prettierd,
    html = formatters.prettierd,
    css = formatters.prettierd,
    scss = formatters.prettierd,
    vue = formatters.prettierd,
  },
  experiments = {
    partial_update = 'diff',
  },
  run_with_sh = false,
})
