# Configure ssh forwarding if using WSL
if string match -qr WSL $(uname -a)
    set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
    set ALREADY_RUNNING $(ps -auxww | grep -q '[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent'; echo $status)
    if test $ALREADY_RUNNING != "0"
        if test -S $SSH_AUTH_SOCK
            echo "removing previous socket..."
            rm $SSH_AUTH_SOCK
        end
        echo "Starting SSH-Agent relay..."
        setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork >/dev/null 2>&1 & disown
    end
end
