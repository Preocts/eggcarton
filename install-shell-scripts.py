import subprocess
from pathlib import Path

def install_shell_scripts():
    # Get list of all files that start with "install-" from shell-scripts directory
    shell_scripts = [x for x in Path("shell-scripts").iterdir() if x.name.startswith("install-")]

    # Run each file
    for shell_script in shell_scripts:
        if input(f"Run {shell_script}? [Y/n]") == "n":
            continue
        print(f"Running {shell_script}...")
        subprocess.run(["bash", shell_script])

if __name__ == "__main__":
    install_shell_scripts()
