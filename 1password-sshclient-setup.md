### Setup SSH piping to windows

Requires Go
Requires socat

```bash
GOOS=windows go install github.com/jstarks/npiperelay@v0.1.0
mv go/bin/windows_amd64/npiperelay.exe /mnt/c/Users/preoc/go/bin/
sudo ln -s /mnt/c/Users/preoc/go/bin/npiperelay.exe /usr/local/bin/npiperelay.exe
```

Add the following to `.profile`

```sh
# 1Password SSH Auth Bridge
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
if [[ $ALREADY_RUNNING != "0" ]]; then
    if [[ -S $SSH_AUTH_SOCK ]]; then        echo "removing previous socket..."
        rm $SSH_AUTH_SOCK
    fi
    echo "Starting SSH-Agent relay..."
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi
```

Update `.gitconfig` to have correct signingkey
(get actual data from 1Password)

