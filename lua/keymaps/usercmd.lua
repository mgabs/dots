#!/usr/bin/env lua

function usercmd(shortcut, command, opts)
  vim.api.nvim_create_user_command(shortcut, command, opts)
end

-- for multiple commands try `:cmd1:cmd2`
usercmd("Y", "yy", { desc = "Copy line" })
-- Configuring suda
usercmd("Ww", ":execute ':silent w !sudo tee % > /dev/null' | :edit!", { desc = "Write as sudo" })
usercmd("WW", ":execute ':silent w !sudo tee % > /dev/null' | :edit!", { desc = "Write as sudo" })
-- tolerate typos
usercmd("W", ":execute ':w!'", { desc = "capital write" })
usercmd("Wq", ":execute ':wq!'", { desc = "tolerate write" })
usercmd("Q", ":execute ':q!'", { desc = "exit without saving" })
