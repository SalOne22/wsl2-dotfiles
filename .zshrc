# -------------------------- ⚙️ General settings ⚙️ ---------------------------

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# General settings
setopt beep
bindkey -e

# compinit settings
zstyle :compinstall filename '/home/salone/.zshrc'

autoload -Uz compinit
compinit

# NVM settings
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

# PATH settings
export PATH="$PATH:$HOME/.cargo/bin"
PNPM_HOME="/home/salone/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------- ✨ Plugins ✨ ------------------------------- 

# Setup znap 🎈
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh

# Start starship ✨
znap eval starship 'starship init zsh'
znap prompt

# Setup plugins
plugins=(
  'zsh-users/zsh-syntax-highlighting'
  'lukechilds/zsh-nvm'
  'lukechilds/zsh-better-npm-completion'
  'marlonrichert/zsh-autocomplete'
  'djui/alias-tips'
  'fdellwing/zsh-bat'
  'chrissicool/zsh-256color'
  'Junker/zsh-archlinux'
  'hlissner/zsh-autopair'
  'zsh-users/zsh-autosuggestions'
  'zplugin/zsh-exa'
  'davidde/git'
  'oldratlee/hacker-quotes'
  'mat2ja/pnpm.plugin.zsh'
  'none9632/zsh-sudo'
  'trystan2k/zsh-tab-title'
  'dashixiong91/zsh-vscode'
  'florentinl/omz-wsl'
)

for plugin in $plugins; do
    znap source "$plugin"
done

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
