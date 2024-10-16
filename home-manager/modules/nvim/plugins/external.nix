{ lib, pkgs, ... }: 
let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };

  packages = [
    "Yazeed1s/oh-lucy.nvim"
    "hrsh7th/nvim-cmp"
    "neovim/nvim-lspconfig"
    "hrsh7th/nvim-cmp"
    "hrsh7th/cmp-nvim-lsp"
    "L3MON4D3/LuaSnip"
  ];

  configPackages = [
    {
      plugin = "rcarriga/nvim-notify";
      config = ''
lua <<EOF
    require("notify").setup({
      -- level = vim.log.levels.DEBUG,
      background_colour = "#000000",
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
EOF
      '';
    }
    {
      plugin = "elentok/format-on-save.nvim";
      config = ''
lua <<EOF
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
EOF
      '';
    }
    {
      plugin = "windwp/nvim-ts-autotag";
      config = ''
lua <<EOF
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true,          -- Auto close tags
    enable_rename = true,         -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
EOF
      '';
    }
    {
      plugin = "MunifTanjim/prettier.nvim";
      config = ''
lua <<EOF
local prettier = require("prettier")
prettier.setup({
  bin = 'prettier',
  filetypes = {
    "lua",
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
EOF
      '';
    }
    {
      plugin = "nvim-treesitter/nvim-treesitter-context";
      config = ''
lua <<EOF
require('treesitter-context').setup {
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
        "class",
        "function",
        "method",
        "for",
        "while",
        "if",
        "table",
        "comment"
    },
    highlight = {
        "Normal",
        "Comment",
    },
}
EOF
      '';
    }
#     {
#       plugin = "nvim-treesitter/nvim-treesitter";
#       config = ''
# lua <<EOF
# require'nvim-treesitter.configs'.setup {
#   -- A list of parser names, or "all" (the five listed parsers should always be installed)
#   ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "vim", "vimdoc", "query" },
# 
#   -- Install parsers synchronously (only applied to `ensure_installed`)
#   sync_install = false,
# 
#   -- Automatically install missing parsers when entering buffer
#   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
#   auto_install = true,
#   volar = {},
# 
#   highlight = {
#     enable = true,
# 
#     -- Using this option may slow down your editor, and you may see some duplicate highlights.
#     -- Instead of true it can also be a list of languages
#     additional_vim_regex_highlighting = false,
#   },
# }
# 
# require('nvim-treesitter.install').compilers = { "gcc" }
# EOF
#       '';
#     }
    {
      plugin = "diepm/vim-rest-console";
      config = ''
lua <<EOF
vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_buffer_name = 'vrc_response_buffer.json'
vim.g.vrc_auto_format_response_patterns = {
  json = "jq",
}

local function get_opened_buffer_names()
  local buffer_names = {}

  for _, buf_handle in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf_handle)
    table.insert(buffer_names, buf_name)
  end

  return buffer_names
end

local function get_buffer_number_from_name(name)
  for _, buf_handle in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf_handle) == name then
      return buf_handle
    end
  end

  return nil
end

function save_set_cookie_lines()
  local buffers = get_opened_buffer_names()

  local json_buffer = nil
  for _, buffer in ipairs(buffers) do
    if buffer:match("%.json$") then
      json_buffer = buffer
      break
    end
  end

  if json_buffer == nil then return end

  local found_buffer = get_buffer_number_from_name(json_buffer)
  if found_buffer == nil then return end

  -- Get lines in json buffer
  local json_lines = vim.api.nvim_buf_get_lines(found_buffer, 0, -1, false)
  if #json_lines > 0 then
    local lines = {}
    for _, line in ipairs(json_lines) do
      if line:find("Set-Cookie", 1, true) == 1 then
        local value = string.gsub(line, "Set%-", "", 1)

        table.insert(lines, value)
      end
    end

    if #lines == 0 then return end

    local f = io.open("cookies.txt", "w")
    if f == nil then return end

    f:write(table.concat(lines, "\n"))
    f:close()
  else
    -- wait for buffer to be loaded
    vim.defer_fn(save_set_cookie_lines, 200)
  end
end

vim.cmd([[
  autocmd BufAdd *.json lua save_set_cookie_lines()
]])
EOF
      '';
    }
  ];

  plugins = map (repo: fromGitHub "HEAD" repo) packages;

  allPlugins = plugins ++ map (pkg: {
    plugin = (fromGitHub "HEAD" pkg.plugin);
    config = pkg.config;
  }) configPackages;
in {
  programs.neovim.plugins = allPlugins;
}
