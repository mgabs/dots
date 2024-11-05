local keymap = require("keymaps")

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },
  },
  keys = keymap.neotree,
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    default_component_configs = {
      name = {
        highlight_opened_files = true,
      },
    },
    filesystem = {
      components = {
        icon = function(config, node, state)
          local highlights = require("neo-tree.ui.highlights")
          local icon = config.default or " "
          local padding = config.padding or " "
          local highlight = config.highlight or highlights.FILE_ICON

          if node.type == "directory" then
            highlight = highlights.DIRECTORY_ICON
            if node:is_expanded() then
              icon = config.folder_open or "-"
            else
              icon = config.folder_closed or "+"
            end
          elseif node.type == "file" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            if success then
              local devicon, hl = web_devicons.get_icon(node.name, node.ext)
              icon = devicon or icon
              highlight = hl or highlight
            end
          end

          return {
            text = icon .. padding,
            highlight = highlight,
          }
        end,
      },
      commands = {
        -- Override delete to use trash instead of rm
        delete = function(state)
          local path = state.tree:get_node().path
          vim.fn.system({ "trash", vim.fn.fnameescape(path) })
          require("neo-tree.sources.manager").refresh(state.name)
        end,
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.api.nvim_command("silent !open -g " .. path)
        end,
      },
      window = {
        popup = {
          position = { col = "100%", row = "2" },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":~")
            local root_len = string.len(root_name) + 4
            return {
              width = math.max(root_len, 50),
              height = vim.o.lines - 6,
            }
          end,
        },
        mappings = {
          -- types
          ["e"] = function()
            vim.api.nvim_exec("Neotree focus filesystem right", true)
          end,
          ["b"] = function()
            vim.api.nvim_exec("Neotree focus buffers right", true)
          end,
          ["g"] = function()
            vim.api.nvim_exec("Neotree focus git_status right", true)
          end,
          --
          ["o"] = "system_open",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          --["/"] = "filter_as_you_type", -- this was the default until v1.28
          ["f"] = "filter_on_submit",
          ["<C-x>"] = "clear_filter",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
          ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
          -- ["S"] = "open_split",
          ["S"] = "split_with_window_picker",
          -- ["s"] = "open_vsplit",
          ["s"] = "vsplit_with_window_picker",
          ["t"] = "open_tabnew",
          --["P"] = "toggle_preview",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          --["Z"] = "expand_all_nodes",
          ["R"] = "refresh",
          ["a"] = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory", -- also accepts the config.show_path option.
          ["d"] = "noop", -- unbind delete
          ["dd"] = "delete", -- bind delete to new mapping
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
          ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree in whatever position is specified in window.position
      -- "open_current",-- netrw disabled, opening a directory opens within the window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    },
    event_handler = {
      {
        event = "file_opened",
        handler = function(file_path)
          local neotree = require("neo-tree")
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          neotree.command.execute({ action = "close" })
        end,
      },
    },
  },
  config = function(_, opts)
    local neotree = require("neo-tree")
    neotree.setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
}

return M
-- return {}
