# Configure ssh forwarding if using WSL
if type -q socat; and string match -qr WSL (uname -a)
    set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
    if not string match -qr $SSH_AUTH_SOCK (ps x)
        echo "Starting SSH-Agent relay..."
        socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork,unlink-early EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork & disown
    end
end
