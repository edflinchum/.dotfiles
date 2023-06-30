# Configure ssh forwarding if using WSL
if string match -qr WSL (uname -a); and type -q socat
    set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
    if not string match -qr 'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent' (ps -xww)
        if test -S $SSH_AUTH_SOCK
            echo "Removing previous socket..."
            unlink $SSH_AUTH_SOCK
        end
        echo "Starting SSH-Agent relay..."
        setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &
        disown
    end
end
