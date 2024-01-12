local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  --
  -- My plugins
  {
    "nvim-orgmode/orgmode",
    lazy = false,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', 'prichrd/netrw.nvim' }
    },
    config = function()
      require("orgmode").setup_ts_grammar()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" }, -- Or run :TSUpdate org
      })
      require("orgmode").setup({
        org_agenda_files = { "~/decode-it/newauro/**/*" },
        -- org_default_notes_file = "~/org/refile.org",
        org_todo_keywords = { "TODO(t)", "QUESTION(q)", "ACTIVE(a)", "NEXT(n)", "FOCUS(f)", "CHECK(c)", "REWORK(r)", "WAITING(w)", "BLOCKED(b)", "CANCELED(x)", "(-)", "|", "DONE(d)" },
        org_todo_keyword_faces = {
          QUESTION = ":foreground purple",
          TODO = ":foreground orange",
          ACTIVE = ":foreground slateblue",
          NEXT = ":foreground yellow",
          FOCUS = ":foreground cyan",
          CHECK = ":foreground DarkViolet",
          REWORK = ":foreground Violet",

          WAITING = ":foreground darkgrey",
          BLOCKED = ":background darkgrey",
          CANCELED = ":foreground grey",

          DONE = ":foreground olive",
        },
        org_log_done = false,
        org_capture_templates = {
          t = {
            description = "Todo",
            template = "* TODO %? %U",
            target = "~/decode-it/newauro/inbox.org",
          },
          j = {
            description = "Journal",
            template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
            target = "~/decode-it/newauro/journal.org",
          },
          n = {
            description = "Notes",
            template = "* %?\n %u",
            target = "~/decode-it/newauro/notes.org",
          },
        },
        org_priority_highest = "A",
        org_priority_default = "C",
        org_priority_lowest = "E",
        org_agenda_skip_scheduled_if_done = true,
        org_agenda_skip_deadline_if_done = true,
        win_split_mode = "vertical",
        org_tags_column = 0,
        org_blank_before_new_entry = { heading = false, plain_list_item = false},
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      sections = {
        lualine_c = {{"filename", path = 2}},
      }
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
}

return plugins
