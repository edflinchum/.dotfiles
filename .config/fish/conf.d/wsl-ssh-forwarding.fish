# Configure ssh forwarding if using WSL
if string match -qr WSL (uname -a); and type -q socat
    set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
    set ALREADY_RUNNING (ps -auxww | grep -q '[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent'; echo $status)
    if test $ALREADY_RUNNING != "0"
        if test -S $SSH_AUTH_SOCK
            echo "removing previous socket..."
            rm $SSH_AUTH_SOCK
            string match -qr systemd (ps -ch 1); and sleep 8
        end
        echo "Starting SSH-Agent relay..."
        setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &>/dev/null & disown
    end
end
