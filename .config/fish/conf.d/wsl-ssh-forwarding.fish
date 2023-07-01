# Configure ssh forwarding if using WSL
if type -q socat; and string match -qr WSL (uname -a)
    set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
    if not string match -qr $SSH_AUTH_SOCK (ps x)
        rm -f $SSH_AUTH_SOCK
        echo "Starting SSH-Agent relay..."
        socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent',nofork &>/dev/null &
        disown
    end
end
