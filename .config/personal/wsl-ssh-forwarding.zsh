# Configure ssh forwarding if using WSL
if (( $+commands[socat] )) && (( $+commands[npiperelay.exe] )) && [[ $(uname -a) =~ WSL ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    if ! [[ $(ps x) =~ $SSH_AUTH_SOCK ]]; then
        echo "Starting SSH-Agent relay..."
        setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork,unlink-early EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &>/dev/null
    fi
fi
