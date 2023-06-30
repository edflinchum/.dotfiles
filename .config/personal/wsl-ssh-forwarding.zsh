# Configure ssh forwarding if using WSL
if (( $+commands[socat] )) && [[ $(uname -a) =~ WSL ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    if ! [[ $(ps -xww) =~ 'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent' ]]; then
        if [ -S $SSH_AUTH_SOCK ]; then
            echo "Removing previous socket..."
            unlink $SSH_AUTH_SOCK
        fi
        echo "Starting SSH-Agent relay..."
        setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &
    fi
fi
