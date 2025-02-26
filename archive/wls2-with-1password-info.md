[source](https://gist.github.com/WillianTomaz/a972f544cc201d3fbc8cd1f6aeccef51)

### Saturday, April 22, 2023
# How to Use 1Password SSH Agent with WSL2 (on Windows 11)

- ### Note:
  - Always look for the official documentation, this tutorial may not suit you as there are new updates to the installation process.
  - References are at the end of the document.

- ### Was used:
  - Windows 11 (`x64`)
  - WSL 2 (`Ubuntu 22.04.2 LTS`)
  - 1Password (`for Windows 8.10.5`)


<br>

---

<br>

## Install WSL2 (on Windows 11)
- Windows 11 makes it easy to install WSL, basically you need to run these commands:
    > ### In your PowerShell(admin) or CMD(admin):
    1. Run the command to install WSL2, and restart the computer.
        ```ls
        # The command will install WSL alongside the Ubuntu distribution.
        wsl –install
        # Or, to install WSL with a specific distro, run the command:
        wsl –install -d <distro-name>
        ```
    2. Other Useful Commands:
        ```ls
        # Checking the image version
        wsl --list --verbose

        # Selecting Distro as Main
        wsl --setdefault <distro-name>

        # If you need to remove a distro
        wsl --unregister <distro-name>

        # If necessary, kill the WSL process
        wsl --shutdown
        ```

<br>

---

<br>

## **1.** Enable 1Password SSH Agent
- Open your 1Password settings and go to the “Developer” section. You need to check the “Use the SSH agent” checkbox.
    - If you have not created or imported your SSH keys into 1Password, you can do it by following this [youtube video](https://www.youtube.com/watch?v=hTwIsFKfjIs "youtube video") or these articles:
        - [Manage SSH keys](https://developer.1password.com/docs/ssh/manage-keys/ "Manage SSH keys")
        - [Authorize Git with ease (in the second stage)](https://developer.1password.com/docs/ssh/manage-keys/ "Authorize Git with ease")

## **2.** Download npiperelay
- This tool (npiperelay) is used for communication between WSL and the 1Password SSH agent. It uses WSL to communicate with Windows Named Pipes.
    1. [Download npiperelay from the GitHub repository](https://github.com/jstarks/npiperelay/releases "GitHub repository")
    2. Unzip it, and paste the npiperelay.exe file in any folder that's configured in your system's PATH.
        - If you don't know how to modify your system's PATH... [Example Here](https://https://www.wikihow.com/Change-the-PATH-Environment-Variable-on-Windows "Example")
            ```ls
            # 1. Create a folder at an address like this
            C:\Users\my-user\folder-npiperelay
            # 2. Create PATH Environment Variable on Windows
            # 3. Run npiperelay.exe
            ```

## **3.** Connect WSL with 1Password's SSH agent
> ### In your WSL distribution:
- _"We need to install `socat` which is a utility to transfer data between channels, this tool will use `npiperelay` to then communicate with the named pipes"_
    ```shell
    sudo apt install socat
    ```
- Create a new file named .agent-bridge.sh in your home directory
    ```shell
    touch $HOME/.agent-bridge.sh && chmod +x $HOME/.agent-bridge.sh
    ```
    1. (IMPORTANT) Create the folder on your root for the `agent.sock` *(How mentioned by @rfay and @Lochnair in the comments)*
        or if you prefer, add the content on `.agent-bridge.sh` at the top of the step bellow
        ```sh
        mkdir -p ~/.1password
        ```
    2. Paste content into File: `.agent-bridge.sh`
        ```shell
        # Code extracted from https://stuartleeks.com/posts/wsl-ssh-key-forward-to-windows/

        # (IMPORTANT) Create the folder on your root for the `agent.sock` (How mentioned by @rfay and @Lochnair in the comments)
        # mkdir -p ~/.1password

        # Configure ssh forwarding
        export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
        # need `ps -ww` to get non-truncated command for matching
        # use square brackets to generate a regex match for the process we want but that doesn't match the grep command running it!
        ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
        if [[ $ALREADY_RUNNING != "0" ]]; then
            if [[ -S $SSH_AUTH_SOCK ]]; then
                # not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
                echo "removing previous socket..."
                rm $SSH_AUTH_SOCK
            fi
            echo "Starting SSH-Agent relay..."
            # setsid to force new session to keep running
            # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
            (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
        fi
        ```
    3. Add the following line at the end of the file `.bashrc`
        ```shell
        source $HOME/.agent-bridge.sh
        ```
## **4.** Finally last step
- Reset your Windows Terminal and you should be able to see your keys imported into 1Password when listing the keys added to the agent.
- Try this command on your WSL2 and if it returns your keys, congratulations you finished the setup!
    ```shell
    ssh-add -l
    ```

<br>

---

<br>

###	**References**
- Links: <br>
  - [Using 1Password's SSH Agent with WSL2](https://dev.to/d4vsanchez/use-1password-ssh-agent-in-wsl-2j6m "Using 1Password's SSH Agent with WSL2")
  - [How to change the PATH environment variable in Windows](https://www.wikihow.com/Change-the-PATH-Environment-Variable-on-Windows "How to change the PATH environment variable in Windows")
