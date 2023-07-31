# Created by newuser for 5.9
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/salone/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Setup znap
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh

# Configure nvm (needs to be before nvm plugin activation)
export NVM_COMPLETION=true
# export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Setup plugins
znap source zsh-users/zsh-syntax-highlighting
znap source lukechilds/zsh-nvm
znap source lukechilds/zsh-better-npm-completion
znap source marlonrichert/zsh-autocomplete
znap source djui/alias-tips
znap source fdellwing/zsh-bat
znap source chrissicool/zsh-256color
znap source Junker/zsh-archlinux
znap source hlissner/zsh-autopair
znap source zsh-users/zsh-autosuggestions
znap source zplugin/zsh-exa
znap source davidde/git
znap source oldratlee/hacker-quotes
znap source mat2ja/pnpm.plugin.zsh
znap source none9632/zsh-sudo
znap source trystan2k/zsh-tab-title
znap source dashixiong91/zsh-vscode
znap source florentinl/omz-wsl

# Start starship ✨
znap eval starship 'starship init zsh'
znap prompt

# Configure autocomplete
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes

# Configure autosuggestion
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# For correct dir handling
export WORDCHARS=${WORDCHARS/\/}

# Configure alias tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="💡Tip: "

# Configure Path
export PATH="$PATH:$HOME/.cargo/bin"

# pnpm
export PNPM_HOME="/home/salone/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# dotfiles managment
alias config='/usr/bin/git --git-dir=/home/salone/.cfg/ --work-tree=/home/salone'
