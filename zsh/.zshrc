#
# Kaley's z shell
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

#
# change prompt:
setopt PROMPT_SUBST
export PROMPT='%F{92}┌─[%F{green}%n%b%F{black}@%F{cyan}%m%F{92}]%f - %F{92}[%F{default}%~%F{92}]%f - %F{92}[%F{yellow}20%D %T%F{92}]
└─[%F{default}${vcs_info_msg_0_}%F{92}] <>%f '
#
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

#
# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#
# Use lf to switch directories and bind it to ctrl-o
#lfcd () {
#    tmp="$(mktemp -uq)"
#    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
#    lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}
#bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

# Make Zsh behave more like bash
bindkey '^[[1;5C' forward-word   # Ctrl+Right arrow key for moving forward a word
bindkey '^[[1;5D' backward-word  # Ctrl+Left arrow key for moving backward a word
bindkey '^[[1;2C' forward-word   # Shift+Right arrow key for selection and moving forward a word
bindkey '^[[1;2D' backward-word  # Shift+Left arrow key for selection and moving backward a word
# Remove custom bindings for Delete and Ctrl+Delete
bindkey '^[[3~'   delete-char
bindkey '^[[3;5~' backward-kill-word


export PATH="/home/rander/.mozbuild/git-cinnabar:$PATH"
#
# Some auto run commands:
#neofetch
neofetch
#cat $HOME/Documents/IMPORTANT/school-todo
#
## Sets Permissions: (Distrobox)
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/podman/bin:$PATH
xhost +si:localuser:$USER > /dev/null 2>&1
PATH=$PATH:/home/$USER/.local/bin

## Fix pip
#source $HOME/.local/share/virtualenv/bin/activate


#
# Extra Path options
export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/cargo/bin:$PATH

#
# Load syntax highlighting; should be last.
eval "$(mcfly init zsh)"
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-auto-notify/auto-notify.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh  2>/dev/null

# pnpm
export PNPM_HOME="/home/rander/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
