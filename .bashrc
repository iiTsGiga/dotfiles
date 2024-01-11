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

## tools
fstr() {
  grep -Rnw "." -e "$1"
}

## oh my posh
eval "$(oh-my-posh init bash --config ~/.omp.json)"

## aliases

if [[ "$TERM" = "xterm-kitty" ]] && which kitten 2>/dev/null >/dev/null; then
  alias ssh="kitten ssh"
  alias icat="kitten icat"
fi

if which xdg-open >/dev/null 2>/dev/null; then
  alias open="xdg-open"
fi

alias gitlog="git log --graph --all --oneline -10"
alias gedit="gnome-text-editor"
alias vim="nvim"

alias bat="bat --paging=never --tabs=4 --style=full --theme='Monokai Extended Origin'"
alias less="bat --paging=always --tabs=4 --style=full --theme='Monokai Extended Origin'"

alias v="nvim"
alias c="clear"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -lah"

if which exa &>/dev/null; then
  alias ls="exa"
  alias ll="exa -lah"
  alias tree="exa -lhT"
fi

alias bashrc='nvim $HOME/.bashrc'

alias qmk_compile="qmk compile -kb cantor -km iitsgiga_home-row-mods"
alias qmk_flash_left="qmk flash -kb cantor -km iitsgiga_home-row-mods -bl dfu-util-split-left"
alias qmk_flash_right="qmk flash -kb cantor -km iitsgiga_home-row-mods -bl dfu-util-split-right"

alias config='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
alias configlog='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME log --graph --all --oneline -10'

# enable open mpi module
if which module &>/dev/null; then
  module load mpi/openmpi-x86_64
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
