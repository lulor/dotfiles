# ==== PROMPT ====
autoload -Uz colors && colors 

# ==== Git ====
# Load version control information
autoload -Uz vcs_info
function precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{red}(%b%c%u%m)%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '[+]'
zstyle ':vcs_info:*' unstagedstr '[*]'
# Untracked files (credit: https://stackoverflow.com/questions/49744179/zsh-vcs-info-how-to-indicate-if-there-are-untracked-files-in-git)
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
    then
        hook_com[misc]='[?]'
  	fi
}
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Replace '%#' with '%(!.#.>)' to have the '>' character
PROMPT='%F{yellow}%~%f${vcs_info_msg_0_} %F{blue}%#%f '

# ==== COMPLETION ====
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# ==== HISTORY NAVIGATION ====
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# ==== HISTORY ====
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY

# ==== ALIAS ====
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias grep='grep --color'
alias gst='git status'

# ==== FZF ====
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ==== EDITOR ====
export VISUAL="nvim"

# ==== PATH ====
export PATH="$HOME/.local/bin:$PATH"

# ==== macOS ====
# bindkey "^[[A" up-line-or-beginning-search # Up
# bindkey "^[[B" down-line-or-beginning-search # Down
# export CLICOLOR=1
# export HOMEBREW_NO_AUTO_UPDATE=1
# export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
# export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"

# ==== Linux ====
# alias ls='ls --color'
# bindkey "$key[Up]" up-line-or-beginning-search # Up
# bindkey "$key[Down]" down-line-or-beginning-search # Down
