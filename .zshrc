# Created by newuser for 5.9

# 环境配置
export PATH="$HOME/.local/bin:$PATH"

# 中文语言CLI
export LC_MESSAGES=zh_CN.UTF-8

# spotify的插件spetify
export PATH=$PATH:/home/bbinn/.spicetify

# zsh历史记录配置
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# 输入法环境变量
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# nvm延迟加载
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm

    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

    nvm "$@"
}

# 补全
autoload -Uz compinit

# 补全使用缓存，避免每次重新扫描
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# 终端插件 补全高亮提示
# plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 终端翻译快捷命令
alias tzh='~/.local/bin/ttrans zh'
alias ten='~/.local/bin/ttrans en'

# --help 连通deepseek翻译 | TT 这种形式
alias TT='hlp trans'
alias EE='hlp expl'

# alias别名
alias nv='nvim'
alias ls='eza'
alias ll='eza -lah'
alias la='eza -a'
alias lt='eza --tree --level=2'
alias tree='eza --tree --level=2'
alias cat='bat'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias grep='grep --color=auto'
alias fzf='fzf --height 40% --layout=reverse --border'  # 模糊查找
alias fzf-vim='fzf --height 60% --layout=reverse --border --preview "bat --style=numbers --color=always {}"'  # 模糊查找

# Starship个性化
eval "$(starship init zsh)"

# zoxide快速跳转
eval "$(zoxide init zsh)"

# fastfetch
if [[ -o interactive ]]; then
   fastfetch
fi
