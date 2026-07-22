# Created by newuser for 5.9

# 历史记录配置
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

# 终端插件 补全高亮
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 终端翻译快捷命令
alias tzh='~/.local/bin/ttrans zh'
alias ten='~/.local/bin/ttrans en'

# --help 连通deepseek翻译 | TT 这种形式
alias TT='hlp trans'
alias EE='hlp expl'


# JetBrains
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then
    . "${___MY_VMOPTIONS_SHELL_FILE}"
fi


# Starship个性化
eval "$(starship init zsh)"


# fastfetch
if [[ -o interactive ]]; then
    fastfetch
fi
