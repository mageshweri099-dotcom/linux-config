#!/usr/bin/env bash

echo "Vicky Fuck Off Start"
sleep 3.0

Install_app(){
    if command -v zypper >/dev/null 2>&1;then
        echo "Installing package in Opensuse"
        sudo zypper install firefox vscode git trash-cli zsh btop ghostty github-cli
    elif command -v pkg >/dev/null 2>&1;then
        # TODO: for freebsd
    elif command -v pacman >/dev/null 2>&1;then
        echo "Installing package in Arch"
        sudo pacman -S --noconfirm --needed firefox vscode git gh-cli \
            trash-cli zsh btop ghostty curl wget
    fi
}

Zsh_install(){
    Shell=$(echo "$SHELL")
    if [[ $Shell == "/usr/bin/zsh" ]]; then
        echo "zsh"
    else
        echo "not zsh"
        chsh -s $(which zsh)
    fi
    trash $HOME/.zshrc

    echo "Reinstalling zsh and zsh conf"
    [[ -f "$HOME/.zshrc" ]] && trash "$HOME/.zshrc"
    cp "$PWD/resource/.zshrc" "$HOME/.zshrc"
}

Install_config(){
    # TODO: do somthing
}


Main(){
    Install_app
    Zsh_install
    echo "Vicky Fuck Off Completed"
}

Main
