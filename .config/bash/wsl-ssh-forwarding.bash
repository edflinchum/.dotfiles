# Configure ssh forwarding if using WSL
if type socat &>/dev/null && type npiperelay.exe &>/dev/null && [[ $(uname -a) =~ WSL ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    if ! [[ $(ps x) =~ $SSH_AUTH_SOCK ]]; then
        echo "Starting SSH-Agent relay..."
        (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork,unlink-early EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork & disown) &>/dev/null
    fi
fi
