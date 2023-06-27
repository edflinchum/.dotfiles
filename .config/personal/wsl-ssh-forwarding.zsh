# Configure ssh forwarding if using WSL
if (( $+commands[socat] )) && [[ $(uname -a) =~ WSL ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    ALREADY_RUNNING=$(ps -auxww | grep -q '[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent'; echo $?)
    if [[ $ALREADY_RUNNING != "0" ]]; then
        if [ -S $SSH_AUTH_SOCK ]; then
            echo "removing previous socket..."
            rm $SSH_AUTH_SOCK
            [[ $(ps -ch 1) =~ systemd ]] && sleep 8
        fi
        echo "Starting SSH-Agent relay..."
        (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &>/dev/null &)
    fi
fi
