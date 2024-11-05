local conf = vim.g.config.plugins
local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
    "crispgm/telescope-heading.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "ptethng/telescope-makefile",
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = conf.telescope.fzf_native.enable, build = "make" },
  },
  -- load from keymaps.lua
  keys = require("keymaps").telescope,
  config = function()
    local telescope = require("telescope")
    local telescopeConfig = require("telescope.config")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local fb_actions = require("telescope").extensions.file_browser.actions
    local icons = require("utils.icons")

    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
    if conf.telescope.grep_hidden then
      table.insert(vimgrep_arguments, "--hidden")
    end
    -- trim the indentation at the beginning of presented line
    table.insert(vimgrep_arguments, "--trim")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = false,
          hidden = true,
          mappings = {
            i = {
              ["<c-n>"] = fb_actions.create,
              ["<c-r>"] = fb_actions.rename,
              ["<c-h>"] = fb_actions.toggle_hidden,
              ["<c-x>"] = fb_actions.remove,
              ["<c-p>"] = fb_actions.move,
              ["<c-y>"] = fb_actions.copy,
              ["<c-a>"] = fb_actions.select_all,
            },
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
        oldfiles = {
          cwd_only = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
        live_grep = {
          only_sort_text = true, -- grep for content and not file name/path
          mappings = {
            i = { ["<c-f>"] = require("telescope.actions").to_fuzzy_refine },
          },
        },
      },
      defaults = {
        file_ignore_patterns = conf.telescope.file_ignore_patterns,
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          i = {
            -- Close on first esc instead of going to normal mode
            -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-l>"] = actions.send_to_qflist,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<cr>"] = actions.select_default,
            ["<c-v>"] = actions.select_vertical,
            ["<c-s>"] = actions.select_horizontal,
            ["<c-t>"] = actions.select_tab,
            ["<c-p>"] = action_layout.toggle_preview,
            ["<c-o>"] = action_layout.toggle_mirror,
            ["<c-h>"] = actions.which_key,
            ["<c-x>"] = actions.delete_buffer,
          },
        },
        prompt_prefix = table.concat({ icons.arrows.ChevronRight, " " }),
        selection_caret = icons.arrows.CurvedArrowRight,
        entry_prefix = "  ",
        multi_icon = icons.arrows.Diamond,
        initial_mode = "insert",
        scroll_strategy = "cycle",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.75,
          height = 0.85,
          -- preview_cutoff = 120,
          prompt_position = "top",
          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },
          vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
          flex = { horizontal = { preview_width = 0.9 } },
        },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
    })

    telescope.load_extension("projects")
    telescope.load_extension("zoxide")
    telescope.load_extension("heading")
    telescope.load_extension("make")
    if conf.noice.enable then
      telescope.load_extension("noice")
    end
    if conf.telescope.fzf_native.enable then
      telescope.load_extension("fzf")
    end
  end,
}

return M
