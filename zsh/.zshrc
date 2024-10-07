# automagically load tmux on launch
if [ "$TMUX" = "" ]; then tmux; fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Extend PATH.
path=(~/bin $path)
export PATH=$PATH:~/.dotnet/tools:/usr/pgadmin4/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.node_modules/bin:$HOME/.npm-packages/bin:$HOME/home/centric/.local/bin:/home/centric/.fly/bin:/home/centric/.local/bin

# Export environment variables.
export GPG_TTY=$TTY
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export TERM=tmux-256color

# Autoload functions.
autoload -Uz zmv

# load plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define aliases.
alias tree='tree -a -I .git'
alias pgstart='sudo service postgresql start'
alias pgstop='sudo service postgresql stop'
alias pgstatus='sudo service postgresql status'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A --color=auto"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

eval "$(starship init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/centric/.bun/_bun" ] && source "/home/centric/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
