# Aliases
alias fetch='clear; fastfetch; blahaj -s -c trans'
alias fzfb='fzf --preview="bat --color=always {}"'
alias nfzf='nvim $(fzf --preview="bat --color=always {}"'
alias vencord='clear;sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias list='pacman -Q | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S'
alias pacfix='sudo rm /var/lib/pacman/db.lck; echo "pacman fixed :3" | lolcat'
alias rx='rar x'
alias reload='source ~/.zshrc'
alias vtube='/mnt/media/SteamLibrary/steamapps/common/VTube\ Studio/vtube.sh'
alias replasma='systemctl --user restart plasma-plasmashell.service'
alias dotpush='cd ~/Priv-dotfiles/; ~/Priv-dotfiles/Scripts/push.sh; cd ~'
alias dotpull='cd ~/Priv-dotfiles/; ~/Priv-dotfiles/Scripts/pull.sh; cd ~'
alias rsync='rsync --progress -r'
alias gicon='gsettings set org.gnome.desktop.interface icon-theme MoreWaita'
alias aurpub='makepkg --printsrcinfo > .SRCINFO;git add PKGBUILD .SRCINFO; git commit; git push'
alias fl-studio-integrator='~/.local/share/applications/fl-studio-integrator'
alias fl-studio-integrator-elm='~/.local/share/applications/fl-studio-integrator-elm'
alias fl-studio-integrator-reg='~/.local/share/applications/fl-studio-integrator-reg'
alias shimejis='~/Priv-dotfiles/Scripts/shimeji.sh'
alias lazygit='lazygit --use-config-file="/home/$USER/.config/lazygit/config.yml,/home/$USER/.config/lazygit/mauve.yml"'
alias sudo='sudo-rs'

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Themes : https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="alanpeabody"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
	archlinux
	paru
	flatpak
	bun
	rust
	deno
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	zsh-autocomplete
	zsh-eza
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# PATH
export PATH=/home/claymorwan/.cargo/bin:$PATH
export PATH=/home/claymorwan/.local/bin:$PATH

# bun completions
[ -s "/home/claymorwan/.bun/_bun" ] && source "/home/claymorwan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Env variables
export EDITOR=nvim
export GTK_USE_PORTAL=1
export XDG_CURRENT_DESKTOP=KDE

eval "$(starship init zsh)"

if [[ "$YAZI_SHELL_SKIP_CMD" != true ]]; then
	ghosttime -t 3 -c brightmagenta
	fetch
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/claymorwan/.dart-cli-completion/zsh-config.zsh ]] && . /home/claymorwan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

PATH="$HOME/.local/bin:${PATH}"
export PATH
