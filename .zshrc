export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="/home/$USER/git/.config/starship.toml"
ZSH_THEME="awesomepanda"
plugins=(git kubectl);
source $ZSH/oh-my-zsh.sh
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *)                       ICON="";;
esac
export STARSHIP_DISTRO="$ICON "
export SIG_SECRET_KEY=JWTSecretKeyDontUseInProduction!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias k=kubectl

# Get commands
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgns='kubectl get namespaces'
alias kgall='kubectl get ingress,service,deployment,pod'

#Configuration commands
alias kuc='kubectl config use-context'
alias ksc='kubectl config set-context "$(kubectl config current-context)"'
alias kns='ksc --namespace'

# Networking
alias kpf='kubectl port-forward '
alias kp='kubectl proxy'

alias kwatch='watch -n 0.2 kubectl get'

eval "$(starship init zsh)"
