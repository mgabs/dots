local M = {}

function getVal(set, key, default)
  if set[key] then
    return set[key]
  else
    return default
  end
end

function M.gmap(mode, shortcut, command, desc, opts)
  local args = {}
  args.desc = desc

  -- setting defaults
  if opts == nil then
    args = { silent = true, remap = false, expr = false }
  else
    args.silent = getVal(opts, "silent", true)
    args.remap = getVal(opts, "remap", true)
    args.expr = getVal(opts, "expr", false)
  end

  vim.keymap.set(mode, shortcut, command, args)
end

function M.map(shortcut, command, desc, opts)
  M.gmap({ "n", "v", "o" }, shortcut, command, desc, opts)
end

function M.nmap(shortcut, command, desc, opts)
  M.gmap({ "n" }, shortcut, command, desc, opts)
end

function M.vmap(shortcut, command, desc, opts)
  M.gmap({ "v" }, shortcut, command, desc, opts)
end

function M.imap(shortcut, command, desc, opts)
  M.gmap({ "i" }, shortcut, command, desc, opts)
end
function M.xmap(shortcut, command, desc, opts)
  M.gmap({ "x" }, shortcut, command, desc, opts)
end

function M.smap(shortcut, command, desc, opts)
  M.gmap({ "s" }, shortcut, command, desc, opts)
end
function M.omap(shortcut, command, desc, opts)
  M.gmap({ "o" }, shortcut, command, desc, opts)
end
function M.lmap(shortcut, command, desc, opts)
  M.gmap({ "l" }, shortcut, command, desc, opts)
end
function M.cmap(shortcut, command, desc, opts)
  M.gmap({ "c" }, shortcut, command, desc, opts)
end
function M.tmap(shortcut, command, desc, opts)
  M.gmap({ "t" }, shortcut, command, desc, opts)
end

return M
