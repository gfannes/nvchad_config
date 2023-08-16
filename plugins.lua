local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
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
        org_todo_keywords = { "INBOX(i)", "UNCLEAR(u)", "TODO(t)", "ACTIVE(a)", "NEXT(n)", "VALIDATION(v)", "REWORK(r)", "WAITING(w)", "BLOCKED(b)", "CANCELED(c)", "(-)", "|", "DONE(d)" },
        org_todo_keyword_faces = {
          INBOX = ":foreground yellow",
          UNCLEAR = ":background red",
          TODO = ":foreground red",
          ACTIVE = ":foreground cyan",
          NEXT = ":foreground orange",
          VALIDATION = ":foreground DarkViolet",
          REWORK = ":background Violet",

          WAITING = ":background darkgrey",
          BLOCKED = ":background grey",
          CANCELED = ":foreground grey",
        },
        org_log_done = false,
        org_capture_templates = {
          i = {
            description = "Inbox",
            template = "* INBOX %?\n%U",
            target = "~/decode-it/newauro/inbox.org",
          },
          t = {
            description = "Todo",
            template = "* TODO %?\n%U",
            target = "~/decode-it/newauro/todo.org",
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
}

return plugins
