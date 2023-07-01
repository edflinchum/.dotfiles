# Configure ssh forwarding if using WSL
if (( $+commands[socat] )) && [[ $(uname -a) =~ WSL ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    if ! [[ $(ss -lx) =~ $SSH_AUTH_SOCK ]]; then
        rm -f $SSH_AUTH_SOCK
        echo "Starting SSH-Agent relay..."
        setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &>/dev/null
    fi
fi
