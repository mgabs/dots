#!/usr/bin/env lua

local utils = require("utils")
local map = utils.map
local gmap = utils.gmap
local nmap = utils.nmap
local vmap = utils.vmap

local keys = {}
-- default_opts = { silent = true, remap = false, expr = false }

keys.mundo = function()
  -- mUndo
  map("<leader>mu", ":MundoToggle<CR>", "MundoToggle")
end

-- FIXME here!!
keys.telescope = {
  -- Search stuff
  -- { "<leader>t:", "<cmd>Telescope search_history<cr>", desc = "Telescope -Search History" },
  { "<leader>t;", "<cmd>Telescope command_history<cr>", desc = "Telescope -Command history" },
  { "<leader>t/", "<cmd>Telescope help_tags<cr>", desc = "Telescope -Help" },
  { "<leader>tO", "<cmd>Telescope vim_options<cr>", desc = "Telescope -Vim Options" },
  { "<leader>tR", "<cmd>Telescope registers<cr>", desc = "Telescope -Registers" },
  { "<leader>tS", "<cmd>Telescope symbols<cr>", desc = "Telescope -Emoji" },
  { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Telescope -Commands" },
  { "<leader>th", "<cmd>Telescope heading<cr>", desc = "Telescope -Headings" },
  { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope -Keymaps" },
  { "<leader>tp", "<cmd>Telescope projects<cr>", desc = "Telescope -Projects" },
  { "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Telescope -Word under cursor" },
  { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope -Strings" },
  {
    "<leader>tf",
    "<cmd>lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }<cr>",
    desc = "Telescope -Word search",
  },
  -- Git
  { "<leader>gh", "<cmd>Telescope git_branches<cr>", desc = "Telescope -Branches" },
  { "<leader>gg", "<cmd>Telescope git_status<cr>", desc = "Telescope -Status" },
  { "<leader>gm", "<cmd>Telescope git_commits<cr>", desc = "Telescope -Commits" },
  -- files
  { "<leader>fb", "<cmd>Telescope file_browser grouped=true<cr>", desc = "Telescope -Filebrowser" },
  { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Telescope -Zoxide" },
  -- { "<leader>ff", "<cmd>" .. utils.funcs.project_files() .. "<cr>", desc = "Telescope -Open file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope -Open file (ignore git)" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope -Recent files" },
  -- misc
  { "<leader>mm", "<cmd>Telescope make<cr>", desc = "Telescope -Run make" },
  { "<leader>tt", "<cmd>Telescope<cr>", desc = "Telescope -Telescope" },
  -- Other
  { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope -Bufferlist" },
  { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope -Search in buffer" },
}

-- FIXME: Check the plugins
keys.gitsigns = function()
  -- gitsigns
  local gs = package.loaded.gitsigns
  -- local gs = require("gitsigns")
  nmap("]c", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, "Next hunk", { expr = true })

  nmap("[c", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, "Previous hunk", { expr = true })

  gmap({ "n", "v" }, "<leader>grr", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
  gmap({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
  gmap({ "o", "x" }, "gH", "<cmd><C-U>Gitsigns select_hunk<cr>", "Select hunk")
  nmap("<leader>g<CR>", "<cmd>lua require('neogit').open()<cr>", "Neogit")
  nmap("<leader>gc", "<cmd>G commit %<cr>", "Commit buffer")
  nmap("<leader>gp", "<cmd>G push<cr>", "Push")

  -- gitsigns
  -- todo: try loaded
  -- local gs = package.loaded.gitsigns
  local gs = require("gitsigns")
  nmap("<leader>gs", gs.stage_buffer, "Git-Stage buffer")
  nmap("<leader>gu", gs.undo_stage_hunk, "Git-Undo stage hunk")
  nmap("<leader>gr", gs.reset_buffer, "Git-Reset buffer")
  nmap("<leader>gx", gs.preview_hunk, "Git-Preview hunk")
  nmap("<leader>gB", function()
    gs.blame_line({ full = true })
  end, "Git-Blame full")
  nmap("<leader>gb", gs.toggle_current_line_blame, "Git-Blame line")
  nmap("<leader>gD", gs.diffthis, "Git-Diff")
  nmap("<leader>gx", gs.toggle_deleted, "Git-Show deleted")
end

-- hydra
keys.hydra = {
  git = "<leader>hg",
  windows = "<leader>hw",
  spelling = "<leader>hz",
  dap = "<leader>hd",
}
nmap("<leader>gm", "Hydra move", "Hydra move")
-- spectra keys
keys.spectre = function()
  local spectreKeys = {
    {
      "<leader>Rr",
      function()
        require("spectre").toggle()
      end,
      desc = "Toggle search and replace",
    },
    {
      "<leader>Rw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Search current word",
    },
    {
      "<leader>Rw",
      mode = "v",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Search current word",
    },
    {
      "<leader>Rf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Search on current file",
    },
  }

  return spectreKeys
end

keys.move = function()
  -- Meta Arrows
  nmap("<M-Left>", "b", "alt-b jumb word left")
  nmap("<M-Right>", "w", "alt-r jumb word right")

  -- Normal-mode commands
  nmap("<M-Down>", ":MoveLine(1)<CR>", "MoveLine Down", { silent = true, remap = true })
  nmap("<M-Up>", ":MoveLine(-1)<CR>", "MoveLine Up", { silent = true, remap = true })
  nmap("<S-M-Left>", ":MoveHChar -1<cr>", { silent = true, remap = false })
  nmap("<S-M-Righ>t", ":MoveHChar 1<cr>", { silent = true, remap = false })
  nmap("<leader>wf", ":MoveWord 1<cr>", "MoveWord right", { silent = true, remap = true })
  nmap("<leader>wb", ":MoveWord -1<cr>", "MoveWord left", { silent = true, remap = true })

  -- Visual-mode commands
  vmap("<M-Down>", ":MoveBlock 1<cr>", "MoveBlock Down", { silent = true, remap = true })
  vmap("<M-Up>", ":MoveBlock -1<cr>", "MoveBlock Up", { silent = true, remap = true })
  vmap("<M-Left>", ":MoveHBlock -1<cr>", "MoveBlock Left", { silent = true, remap = true })
  vmap("<M-Right>", ":MoveHBlock 1<cr>", "MoveBlock Right", { silent = true, remap = true })
end

keys.tree = function()
  nmap("-", ":Neotree<CR>", "Open Neotree", { silent = true, remap = true })
end

keys.msurrond = function()
  -- mini surround
  local msurround = require("mini.surround")
  nmap("sa", msurround.add, "Add surrounding")
  nmap("sd", msurround.delete, "Delete surrounding")
  nmap("sh", msurround.highlight, "Highlight surrounding")
  nmap("sr", msurround.replace, "Replace surrounding")
  -- nmap("st", "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobject") -- FIXME
  -- mini comment
  -- nmap( "<leader>mu", , true)
  -- nmap( "<leader>mu", , true)
  -- nmap( "<leader>sn", msurround.n_lines,  "Surround update n lines")
  -- nmap( "<leader>sf", msurround.find,  "Find right surrounding")
  -- nmap( "<leader>sF", msurround.find_left,  "Find left surrounding")
end

keys.spread = function()
  -- spread
  local spread = require("spread")
  nmap("<leader>mSc", spread.combine, "Spread - combine", { silent = true })
  nmap("<leader>mSs", spread.out, "Spread - split", { silent = true })
  -- url view
  -- nmap("<leader>mu", spread.out, "Spread - split", { silent = true })
  nmap("<leader>mSs", "<cmd>UrlView buffer action=clipboard<cr>", "Copy URL", { silent = true })
  -- TODO: dap
  -- gmap({"n"}, "<leader>d",  , true)
end

keys.luapad = function()
  nmap("<leader>cr", function()
    require("luapad.run").run()
  end, "Run buffer content")
  nmap("<leader>cl", function()
    require("luapad").init()
  end, "Luapad")
  nmap("<leader>ct", "<cmd>lua MiniTest.run_file()<cr>", "MiniTest for current file", { silent = true })
  nmap("<leader>cs", "<cmd>lua MiniTest.run()<cr>", "Run MiniTest suite", { silent = true })
end

keys.gokeys = function()
  -- Coding
  nmap("<leader>ca", "<cmd>GoCodeAction<cr>", "Code - action")
  nmap("<leader>ce", "<cmd>GoIfErr<cr>", "Code - Add if err")
  nmap("<leader>cha", "<cmd>GoAddTag<cr>", "Code - Add tags to struct")
  nmap("<leader>chr", "<cmd>GoRMTag<cr>", "Code - Remove tags to struct")
  nmap("<leader>chc", "<cmd>GoCoverage<cr>", "Code - Test coverage")
  nmap("<leader>chg", "<cmd>lua require('go.comment').gen()<cr>", "Generate comment")
  nmap("<leader>chv", "<cmd>GoVet<cr>", "Code - Go vet")
  nmap("<leader>cht", "<cmd>GoModTidy<cr>", "Code - Go mod tidy")
  nmap("<leader>chi", "<cmd>GoModInit<cr>", "Code - Go mod init")
  nmap("<leader>ci", "<cmd>GoToggleInlay<cr>", "Code - Toggle inlay")
  nmap("<leader>cl", "<cmd>GoLint<cr>", "Code - Run linter")
  nmap("<leader>co", "<cmd>GoPkgOutline<cr>", "Code - Outline")
  nmap("<leader>cr", "<cmd>GoRun<cr>", "Code - Run")
  nmap("<leader>cs", "<cmd>GoFillStruct<cr>", "Code - Autofill struct")
  -- Tests
  nmap("<leader>ctr", "<cmd>GoTest<cr>", "Code - Run tests")
  nmap("<leader>cta", "<cmd>GoAlt!<cr>", "Code - Open alt file")
  nmap("<leader>cts", "<cmd>GoAltS!<cr>", "Code - Open alt file in split")
  nmap("<leader>ctv", "<cmd>GoAltV!<cr>", "Code - Open alt file in vertical split")
  nmap("<leader>ctu", "<cmd>GoTestFunc<cr>", "Code - Run test for current func")
  nmap("<leader>ctf", "<cmd>GoTestFile<cr>", "Code - Run test for current file")
  -- Code Lens
  nmap("<leader>cxl", "<cmd>GoCodeLenAct<cr>", "Toggle Lens")
  nmap("<leader>cxa", "<cmd>GoCodeAction<cr>", "Code Action")
  gmap({ "v" }, "<leader>cj", "<cmd>'<,'>GoJson2Struct<cr>", "Json to struct")
end

keys.lspkeys = function()
  local lspmap = {
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "<leader>lD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "<leader>lk", vim.lsp.buf.hover, desc = "Hover" },
    { "gk", vim.lsp.buf.hover, desc = "Hover" },
    {
      "gd",
      function()
        require("telescope.builtin").lsp_definitions({ reuse_win = true })
      end,
      desc = "Goto Definition",
      has = "definition",
    },
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },

    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    {
      "gI",
      function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
      end,
      desc = "Goto Implementation",
    },
    { "<leader>lI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },

    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
    {
      "gy",
      function()
        require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
      end,
      desc = "Goto T[y]pe Definition",
    },
    { "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
    { "gh", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
    { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },

    { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
    {
      "<leader>lA",
      function()
        vim.lsp.buf.code_action({
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        })
      end,
      desc = "Source Action",
      has = "codeAction",
    },

    -- on-attach
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "<leader>ll", vim.diagnostic.open_float, desc = "Line Diagnostics" },
    { "<leader>ln", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
    { "<leader>lp", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
    { "<leader>lq", vim.diagnostic.setloclist, desc = "Diagnostics in qflist" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>le", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>lwd", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Symbols" },
    { "<leader>lwa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder" },
    { "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Folders" },
    { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
  }
  return lspmap
end

-- https://github.com/ThePrimeagen/refactoring.vim
keys.refactor = function()
  local refactor = require("refactoring")

  map("<leader>rs", function()
    refactor.select_refactor()
  end, "prompt for a refactor to apply when the remap is triggered")

  map("<leader>rr", function()
    vim.lsp.buf.rename()
  end, "rename var")

  -- Note that not all refactor support both normal and visual mode
  map("<leader>re", function()
    refactor.refactor("Extract Function")
  end, "Extract Function")

  -- Extract function supports only visual mode
  map("<leader>rf", function()
    refactor.refactor("Extract Function To File")
  end, "Extract Function to a File")

  -- Extract variable supports only visual mode
  map("<leader>rv", function()
    refactor.refactor("Extract Variable")
  end, "Extract Variable")

  -- Inline func supports only normal
  nmap("<leader>rI", function()
    refactor.refactor("Inline Function")
  end, "Inline Function")

  -- Inline var supports both normal and visual mode
  nmap("<leader>ri", function()
    refactor.refactor("Inline Variable")
  end, "Inline Variable")

  nmap("<leader>rb", function()
    refactor.refactor("Extract Block")
  end, "Extract Block")

  -- Extract block supports only normal mode
  nmap("<leader>rbf", function()
    refactor.refactor("Extract Block To File")
  end, "Extract block to a File")
end

keys.debugPrint = function()
  local debugPrint = require("debugprint")
  nmap(
    "g?p",
    function()
      return debugPrint.debugprint()
    end,
    "Add debug print line below",
    {
      expr = true,
    }
  )
  nmap(
    "g?P",
    function()
      return debugPrint.debugprint({ above = true })
    end,
    "Add debug print line above",
    {
      expr = true,
    }
  )
  nmap(
    "g?v",
    function()
      return debugPrint.debugprint({ variable = true })
    end,
    "Print debug var below",
    {
      expr = true,
    }
  )
  nmap(
    "g?o",
    function()
      return debugPrint.debugprint({ motion = true, variable = true })
    end,
    "Add debug print line with motion below",
    {
      expr = true,
    }
  )
  nmap("g?d", function()
    debugPrint.deleteprints()
  end, "Delete debug prints")
  nmap("g?D", function()
    debugPrint.deleteprints()
  end, "Delete debug prints")
  vmap("g?d", function(opts)
    debugPrint.deleteprints(opts)
  end, "Delete debug prints", { range = true })
  vmap("g?D", function(opts)
    debugPrint.deleteprints(opts)
  end, "Delete debug prints", { range = true })
end

return keys
