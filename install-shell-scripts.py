import subprocess

RUN_ORDER = [
    "install-dotfiles.sh",
    "install-randoms.sh",
    "install-vim-plug.sh",
    "install-git.sh",
    "install-pythons.sh",
    "install-braghook.sh",
    "install-npm_yarn.sh",
    "install-go.sh",
    "install-docker.sh",
    # "install-1password.sh",
    # "install-exercism-cli.sh",
    # "install-vscode.sh",
]


def install_shell_scripts() -> int:
    print("This script will run the following shell scripts:")
    print("\n".join(RUN_ORDER))
    if input("Continue? [y/N]") != "y":
        return 1

    # Run each file
    for shell_script in RUN_ORDER:
        print(f"Running {shell_script}...")
        target = f"shell-scripts/{shell_script}"
        subprocess.run(["bash", target])
    return 0

if __name__ == "__main__":
    raise SystemExit(install_shell_scripts())
