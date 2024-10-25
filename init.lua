-- References to ./lua/
local keymaps = require("keymaps")

-- set leader
keymaps.leader("//")

-- Load global functions
require("core.globals")
-- configuration management
require("core.config").init()
-- Plugin management via lazy
require("core.lazy")
-- Vim autocommands/autogroups
require("core.autocmd")
-- mappings
keymaps.load_keys()
-- usercmds
keymaps.load_cmds()
