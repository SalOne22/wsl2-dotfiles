# -------------------------- ⚙️ General settings ⚙️ ---------------------------

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# General settings
setopt beep
bindkey -e

# NVM settings
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

# PATH settings
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
PNPM_HOME="/home/salone/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export DENO_INSTALL="/home/salone/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ------------------------------- ✨ Plugins ✨ ------------------------------- 

# Setup znap 🎈
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh

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
znap source mat2ja/pnpm.plugin.zsh
znap source none9632/zsh-sudo
znap source trystan2k/zsh-tab-title
znap source florentinl/omz-wsl

# Start starship ✨
znap eval starship 'starship init zsh'
znap prompt

# ------------------------ ⚙️ Plugin configuration ⚙️ -------------------------

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

# dotfiles management
alias config='/usr/bin/git --git-dir=/home/salone/.cfg/ --work-tree=/home/salone'
