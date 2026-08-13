# .zshrc

# 环境配置
export PATH="$HOME/.local/bin:$HOME/.spicetify:$PATH"

# 中英文环境配置
export LANG=en_US.UTF-8
export LC_MESSAGES=zh_CN.UTF-8

# 输入法配置
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

# zsh 插件
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 工具初始化
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# fzf 配置
export FZF_DEFAULT_OPTS="
--height 40%
--layout=reverse
--border
"

# 快捷命令
alias tzh="$HOME/.local/bin/ttrans zh"
alias ten="$HOME/.local/bin/ttrans en"

alias TT='hlp trans'
alias EE='hlp expl'


# 常用 alias
alias nv='nvim'

alias ff='fzf \
--height 60% \
--layout=reverse \
--border \
--preview "bat --style=numbers --color=always {}" \
--preview-window=right:65%:wrap:border-left'

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
