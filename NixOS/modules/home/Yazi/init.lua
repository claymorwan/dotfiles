-- Border
require("full-border"):setup()

-- Starship
require("starship"):setup()

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
