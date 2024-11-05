local utils = require("utils")
local funcs = utils.funcs
local map = utils.map
local gmap = utils.gmap
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap

local keys = {}
-- default_opts = { silent = true, remap = false, expr = false }

keys.leader = function(leader)
  vim.keymap.set({ "n", "v" }, leader, "<Nop>", { silent = true })
  vim.g.mapleader = leader
end

keys.general = function()
  -- open lazy
  vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<cr>")

  -- Save key strokes
  map(";", ":", "';' to command", { silent = false })
  map("q", ":execute 'bd'<CR>", "exit without saving")
  map("Q", "@@", "use the last macro")
  map("K", "i<CR><ESC>", "Split (unjoin) lines - join <J>")
  nmap("<space>", ":update!<CR>", "Space to save", { silent = false })

  -- buffers
  nmap("[b", ":bprevious<CR>", "Prev tab")
  nmap("]b", ":bnext<CR>", "next tab")
  nmap("[B", ":bfirst<CR>", "first tab")
  nmap("]B", ":blast<CR>", "last tab")
  nmap("<tab>", "<cmd>bnext<cr>", "Next buffer")
  nmap("<S-tab>", "<cmd>bprevious<cr>", "Prev buffer")

  -- yanking
  vmap("<C-c>", '"+yi', "ctrl-c copy")
  vmap("<C-x>", '"+c', "ctrl-x cut")
  vmap("<C-v>", 'c<ESC>"+p', "ctrl-v paste")
  imap("<C-V>", '<ESC>"+pa', "ctrl-V paste")
  -- FIXME
  -- vmap("<Leader>y", "\"yy <Bar> :call system('xclip', @y)<CR>", "yank to sysclip")
  -- nmap("<Leader>y", '"*y<CR>', "yank")
  -- nmap("<Leader>p", '"*p<CR>', "paste")
  -- nmap("<Leader>Y", '"+y<CR>', "yank+")
  -- nmap("<Leader>P", '"+p<CR>', "paste+")
  -- nmap("<leader>p", "m`o<ESC>p``", "paste below current line")
  -- nmap("<leader>P", "m`O<ESC>p``", "paste above current line")
  -- nmap("<leader>y", "<cmd>%yank<cr>", "yank entire buffer")

  -- better indenting
  vmap(">", ">gv", "continuous indent")
  vmap("<", "<gv", "continuous unindent")

  -- paste over currently selected text without yanking it
  -- vmap("p", '"_dp', "")
  -- vmap("P", '"_dP', "")
  -- see also https://stackoverflow.com/q/10723700/6064933.
  gmap(
    { "n", "v" },
    "p",
    '"_c<Esc>p',
    "Replace visual selection with text in register without contaminate the register"
  )

  -- -- Remap for dealing with visual line wraps
  -- nmap("k", "v:count == 0 ? 'gk' : 'k'")
  -- nmap("j", "v:count == 0 ? 'gj' : 'j'")

  -- Cancel search highlighting with ESC
  gmap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Clear hlsearch and ESC")

  -- move over a closing element in insert mode
  imap("<C-l>", function()
    return funcs.escapePair()
  end, "Ctr-l move to closing")

  --  hl
  nmap("<ESC>", "<cmd>noh<cr>", "clear highlighting")
  nmap("<leader>3", "<cmd>set hlsearch!<CR>", "")
  nmap("<leader>4", "<cmd>set cursorline!<CR>", "")

  nmap("<leader>w", "<cmd>update!<cr>", "save buffer")
  nmap("<leader>q", "<cmd>x<cr>", "quit current window")
  nmap("<leader>Q", "<cmd>qa!<cr>", "quit nvim")

  -- quit
  nmap("<leader>q", "<cmd>qa!<cr>", "quit nvim")
  nmap("<M-a>", "ggVG", "toggle select all")
  nmap("<leader>a", "ggVG", "select all in buffer")

  nmap("<f5>", ":AsyncTask file-run<cr>", "Run AsyncRun", { silent = true })
  nmap("<f9>", ":AsyncTask file-build<cr>", "Run AsyncBuild", { silent = true })
end

keys.leadkeys = function()
  -- mUndo
  map("<leader>mu", ":MundoToggle<CR>", "MundoToggle")

  -- Reload snippets folder
  nmap("<leader>ms", "<cmd>source ~/.config/nvim/snippets/*<cr>", "Reload snippets")
  -- open init
  nmap("<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", "open init.lua")
  -- reload init
  nmap("<leader>sv", function()
    vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
    vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
  end, "reload init.lua")

  -- buffers
  nmap("<leader>bD", "<cmd>%bd|e#|bd#<cr>", "Close all but the current buffer")
  nmap("<leader>bd", "<cmd>Bdelete<cr>", "Close buffer")
  -- nmap("<leader><tab>", "<cmd>e#<cr>", "Previous Buffer") -- TODO: better desc
  -- scratch
  nmap("<leader>bs", utils.scratch, "Create a scratch buffer")
  nmap("<leader>br", utils.scratchRedir, "Command to scratch buffer")

  -- Quickfix
  nmap("<leader>qj", "<cmd>cnext<cr>", "Next entry")
  nmap("<leader>qk", "<cmd>cprevious<cr>", "Previous entry")
  nmap("<leader>qq", "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle Quickfix")

  -- Search for 'FIXME', 'HACK', 'TODO', 'NOTE'
  nmap("<leader>qt", function()
    funcs.search_todos()
  end, "List TODOs")
end

-- toggles
keys.toggles = function()
  nmap("<leader>vn", function()
    funcs.notify("Toggling numbering", vim.log.levels.INFO, "core.mappings")
    vim.o.number = vim.o.number == false and true or false
    vim.o.relativenumber = vim.o.relativenumber == false and true or false
  end, "Toggle numbering")

  nmap("<leader>vh", function()
    funcs.notify("Toggling hidden chars", vim.log.levels.INFO, "core.mappings")
    vim.o.list = vim.o.list == false and true or false
  end, "Toggle hidden chars")

  nmap("<leader>vl", function()
    funcs.notify("Toggling signcolumn", vim.log.levels.INFO, "core.mappings")
    vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
  end, "Toggle signcolumn")

  nmap("<leader>vv", function()
    funcs.notify("Toggling virtualedit", vim.log.levels.INFO, "core.mappings")
    vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
  end, "Toggle virtualedit")

  nmap("<leader>vs", function()
    funcs.notify("Toggling spell", vim.log.levels.INFO, "core.mappings")
    vim.o.spell = vim.o.spell == false and true or false
  end, "Toggle spell")

  nmap("<leader>vw", function()
    funcs.notify("Toggling wrap", vim.log.levels.INFO, "core.mappings")
    vim.o.wrap = vim.o.wrap == false and true or false
  end, "Toggle wrap")

  nmap("<leader>vc", function()
    funcs.notify("Toggling cursorline", vim.log.levels.INFO, "core.mappings")
    vim.o.cursorline = vim.o.cursorline == false and true or false
  end, "Toggle cursorline")

  nmap("<leader>vo", function()
    funcs.notify("Toggling colorcolumn", vim.log.levels.INFO, "core.mappings")
    funcs.toggle_colorcolumn()
  end, "Toggle colorcolumn")

  nmap("<leader>vt", "<cmd>lua require('core.plugins.lsp.utils').toggle_virtual_text()<cr>", "Toggle Virtualtext")

  nmap("<leader>vS", "<cmd>windo set scb!<cr>", "Toggle Scrollbind")

  nmap("<leader>vf", "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>", "Toggle format on save")
end

-- load plugins keys
local plugKeys = require("keymaps/plugins")
keys = funcs.overload(keys, plugKeys)

keys.load_keys = function()
  keys.general()
  keys.leadkeys()
  keys.toggles()
  keys.tree()
end

keys.load_cmds = function()
  require("keymaps.usercmd")
end

return keys
