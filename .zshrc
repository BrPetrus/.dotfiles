# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vim=nvim
alias status="curl status.fi.muni.cz"
export EDITOR=nvim

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH="$HOME/.dotnet:$PATH"
export MSBuildSDKsPath="/home/bruno/.dotnet/sdk/3.1.416/Sdks"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias activateConda='source ~/anaconda3/bin/activate'

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
alias emacs="emacsclient -c -a 'emacs'"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bruno/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bruno/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/bruno/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/bruno/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/bruno/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/bruno/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

