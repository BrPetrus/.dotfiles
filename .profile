
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

export GPG_TTY=$(tty)

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Programs-binaries/eclipse:$PATH"

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx
fi
