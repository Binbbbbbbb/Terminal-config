# .zshrc

# 环境配置
export PATH="$HOME/.local/bin:$HOME/.spicetify:$PATH"

# 中英文配置
export LANG=en_US.UTF-8
export LC_MESSAGES=zh_CN.UTF-8

# 输入法
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx


# nvm 延迟加载
export NVM_DIR="$HOME/.nvm"

nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    nvm "$@"
}


# 历史记录
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


# shell 行为
setopt AUTO_CD
setopt NUMERIC_GLOB_SORT


# 补全
autoload -Uz compinit
compinit -C


# fzf 配置
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
--height=60%
--layout=reverse
--border=rounded
--preview-window=right:60%:wrap:border-left"

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"
source <(fzf --zsh)


# zsh 插件
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source /usr/share/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# 工具初始化
eval "$(starship init zsh)"  # 终端美化
eval "$(zoxide init zsh)"  # zoxide 快速跳转


# 快捷命令
# 翻译
alias tzh="$HOME/.local/bin/ttrans zh"
alias ten="$HOME/.local/bin/ttrans en"

alias TT='hlp trans'
alias EE='hlp expl'


# 常用 alias
alias nv='nvim'

alias ls='eza'
alias ll='eza -lah'
alias la='eza -a'
alias lt='eza --tree --level=2'
alias tree='eza --tree --level=2'

alias cat='bat'
alias diff='colordiff'

alias df='df -h'
alias du='du -h'
alias free='free -h'
alias grep='grep --color=auto'


# 启动显示
if [[ -o interactive ]] && command -v fastfetch >/dev/null; then
    fastfetch
fi
