# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc

### CUSTOM COMMANDS

## oh my posh
if command -v oh-my-posh &>/dev/null; then
  eval "$(oh-my-posh init bash --config ~/.omp.json)"
fi

## zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd bash)"
fi

## aliases

if [[ "$TERM" = "xterm-kitty" ]] && command -v kitten &>/dev/null; then
  alias ssh="kitten ssh"
  alias icat="kitten icat"
fi

if command -v xdg-open &>/dev/null; then
  alias open="xdg-open"
fi

if command -v rg &>/dev/null; then
  alias fstr="rg -uuSP"
else
  alias fstr="grep -Rn . -P -e"
fi

alias gitlog="git log --graph --all --oneline -10"
alias gedit="gnome-text-editor"

if command -v nvim &>/dev/null; then
  alias vim="nvim"
  alias v="nvim"
  export EDITOR="$(command -v nvim)"
  export MANPAGER='nvim +Man!'
fi

if command -v bat &>/dev/null; then
  bat_cmd="bat --tabs=4 --color=auto --theme='Monokai Extended Origin'"
  alias bat="$bat_cmd --paging=never --style=full"
  alias cat="$bat_cmd --paging=never --style=plain"
  alias less="$bat_cmd --paging=always --style=full"
fi

alias c="clear"
alias cls="printf '\033[2J\033[3J\033[1;1H'"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -lah"

if command -v exa &>/dev/null; then
  alias ls="exa"
  alias ll="exa -lah"
  alias tree="exa -lhT"
fi

if command -v fd &>/dev/null; then
  alias find="fd -pu"
fi

alias bashrc='$EDITOR $HOME/.bashrc'

alias qmk_compile="qmk compile -kb cantor -km iitsgiga_home-row-mods"
alias qmk_flash_left="qmk flash -kb cantor -km iitsgiga_home-row-mods -bl dfu-util-split-left"
alias qmk_flash_right="qmk flash -kb cantor -km iitsgiga_home-row-mods -bl dfu-util-split-right"

alias config='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
alias configlog='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME log --graph --all --oneline -10'

alias py='python'

# enable open mpi module
if command -v module &>/dev/null; then
  module load mpi/openmpi-x86_64
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
