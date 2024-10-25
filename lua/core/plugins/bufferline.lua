-- git branch
local branch = {
  "branch",
  icon = "",
}

-- git diff status
local diff = {
  "diff",
  colored = false,
}

local function generate_opts(bufferline)
  return {

    mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- mode = "tabs", -- to only show tabpages instead
    -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    style_preset = bufferline.style_preset.minimal,
    numbers = "none",
    max_name_length = 16,
    max_prefix_length = 14,
    tab_size = 25,
    highlights = {
      buffer_selected = {
        guifg = "#f0f0f0",
        gui = "bold,italic",
      },
      fill = {
        guibg = "#292b2e",
      },
      tab_close = {
        guibg = "#292b2e",
      },
    },
    close_command = "bdelete! %d",
    right_mouse_command = nil,
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "icon",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    diagnostics = "nvim_lsp",
    custom_filter = function(bufnr)
      -- if the result is false, this buffer will be shown, otherwise, this
      -- buffer will be hidden.

      -- filter out filetypes you don't want to see
      local exclude_ft = { "qf", "fugitive", "git" }
      local cur_ft = vim.bo[bufnr].filetype
      local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

      if should_filter then
        return false
      end

      return true
    end,
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "id",
    color_icons = false,
    separator_style = { "", "" }, -- 'slant' | 'thick' | 'thin' | { 'any', 'any' },
    truncate_names = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "[File Explorer]",
        text_align = "center", -- 'left' | 'center' | 'right'
        highlight = "BufferLineInfoSelected",
        separator = true,
      },

      {
        filetype = "NvimTree",
        text = "[File Explorer]",
        text_align = "center", -- 'left' | 'center' | 'right'
        highlight = "BufferLineInfoSelected",
        separator = true,
      },

      {
        filetype = "aerial",
        text = "[Outline]",
        text_align = "center", -- 'left' | 'center' | 'right'
        highlight = "BufferLineInfoSelected",
        separator = true,
      },
    },
  }
end

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true }, -- optional
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    local opts = generate_opts(bufferline)
    bufferline.setup({ options = opts })
  end,
}
