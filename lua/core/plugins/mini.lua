return {

  {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    -- is not loaded without explicitly saying it
    config = true,
  },

  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Number of lines within which surrounding is searched
      n_lines = 50,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,
      config = {
        function()
          local keys = require("keymaps")
          keys.msurrond()
        end,
      },
    },
  },

  {
    "echasnovski/mini.align",
    event = { "BufReadPre", "BufNewFile" },
    -- is not loaded without explicitly saying it
    config = true,
  },

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    version = false,
    config = true,
  },

  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          -- Highlight 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          hex_color = hi.gen_highlighter.hex_color(),
          -- TODO: tailwind integration?
        },
      }
    end,
  },

  -- {
  --   "echasnovski/mini.files",
  --   event = { "VimEnter" },
  --   opts = {
  --     windows = {
  --       -- Whether to show preview of directory under cursor
  --       preview = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     local show_dotfiles = true
  --     local filter_show = function()
  --       return true
  --     end
  --     local filter_hide = function(fs_entry)
  --       return not vim.startswith(fs_entry.name, ".")
  --     end
  --     local toggle_dotfiles = function()
  --       show_dotfiles = not show_dotfiles
  --       local new_filter = show_dotfiles and filter_show or filter_hide
  --       MiniFiles.refresh({ content = { filter = new_filter } })
  --     end
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "MiniFilesBufferCreate",
  --       callback = function(args)
  --         local buf_id = args.data.buf_id
  --         -- Tweak left-hand side of mapping to your liking
  --         vim.keymap.set("n", "H", toggle_dotfiles, { desc = "Toggle hidden files", buffer = buf_id })
  --       end,
  --     })
  --     require("mini.files").setup(opts)
  --   end,
  --   keys = {
  --     {
  --       "-",
  --       function()
  --         MiniFiles.open()
  --       end,
  --       desc = "Open Mini Files",
  --     },
  --   },
  -- },
}
