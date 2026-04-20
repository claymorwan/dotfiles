-- Border
require("full-border"):setup()

--Git
require("git"):setup()

-- Show symlink in status bar (https://yazi-rs.github.io/docs/tips/#symlink-in-status)
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- Archivemount
--require("archivemount"):setup()

-- Fuse
-- require("fuse-archive"):setup()

-- require("gvfs"):setup({
-- 	-- (Optional) Allowed keys to select device.
-- 	which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
--
-- 	-- (Optional) Save file.
-- 	-- Default: ~/.config/yazi/gvfs.private
-- 	save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
--
-- 	-- (Optional) disable/enable remember passwords using keyring. Default: true
-- 	enabled_keyring = false,
-- 	-- (Optional) save password automatically after mounting. Default: false
-- 	save_password_autoconfirm = true,
-- })

-- Starship
require("starship"):setup()

-- Yamb
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
	table.insert(bookmarks, {
		tag = "Scoop Local",

		path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
		key = "p",
	})
	table.insert(bookmarks, {
		tag = "Scoop Global",
		path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
		key = "P",
	})
end
table.insert(bookmarks, {
	tag = "Desktop",
	path = home_path .. path_sep .. "Desktop" .. path_sep,
	key = "d",
})

require("yamb"):setup({
	-- Optional, the path ending with path seperator represents folder.
	bookmarks = bookmarks,
	-- Optional, recieve notification everytime you jump.
	jump_notify = true,
	-- Optional, the cli of fzf.
	cli = "fzf",
	-- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	-- Optional, the path of bookmarks
	path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
			or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})
