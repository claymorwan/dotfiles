# Aliases
alias fetch='clear; fastfetch; blahaj -s -c trans'
alias fzfb='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf --preview="bat --color=always {}"'
alias equicord='clear;sh -c "$(curl -sS https://raw.githubusercontent.com/Equicord/Equicord/refs/heads/main/misc/install.sh)")"'
alias pacfix='sudo rm /var/lib/pacman/db.lck; echo "pacman fixed :3" | lolcat'
alias reload='source ~/.zshrc'
alias vtube='/mnt/media/SteamLibrary/steamapps/common/VTube\ Studio/vtube.sh'
alias replasma='systemctl --user restart plasma-plasmashell.service'
alias dotpush='cd ~/.dotfiles/; ~/.dotfiles/Scripts/push.sh; cd ~'
alias dotpull='cd ~/.dotfiles/; ~/.dotfiles/Scripts/pull.sh; cd ~'
alias rsync='rsync --progress'
alias aurpub='makepkg --printsrcinfo > .SRCINFO;git add PKGBUILD .SRCINFO; git commit; git push'
alias fl-studio-integrator='~/.local/share/applications/fl-studio-integrator'
alias fl-studio-integrator-elm='~/.local/share/applications/fl-studio-integrator-elm'
alias fl-studio-integrator-reg='~/.local/share/applications/fl-studio-integrator-reg'
alias shimejis='~/Priv-dotfiles/Scripts/shimeji.sh'
alias lazygit='lazygit --use-config-file="/home/$USER/.config/lazygit/config.yml,/home/$USER/.config/lazygit/mauve.yml"'
alias cls='clear'
alias end4-upd='~/.dotfiles/Submodules/end-4/update.sh'
alias ip='ip -c'
alias hyprlockrepair="hyprctl --instance 0 'keyword misc:allow_restore_session_lock 1'; hyprctl --instance 0 'disatch exec hyprlock'"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Themes : https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="alanpeabody"


# Auto-correction.
#ENABLE_CORRECTION="true"

# Plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	git
	git-lfs
	gh
	python
	dotnet
	paru
	flatpak
	bun
	rust
	deno
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	zsh-autocomplete
	eza
	archlinux
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Env variables
# export GTK_USE_PORTAL=1


# Completion
#- dart
[[ -f /home/claymorwan/.dart-cli-completion/zsh-config.zsh ]] && . /home/claymorwan/.dart-cli-completion/zsh-config.zsh || true
#- bun
[ -s "/home/claymorwan/.bun/_bun" ] && source "/home/claymorwan/.bun/_bun"



eval "$(starship init zsh)"
if [[ "$YAZI_SHELL_SKIP_CMD" != true ]]; then
	ghosttime -t 3 -c brightmagenta
	fetch
fi

## [/Completion]
