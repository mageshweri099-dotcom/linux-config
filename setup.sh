#!/usr/bin/env bash

echo "Vicky Fuck Off"

Install_app(){
    if command -v zypper >/dev/null 2>&1;then
        sudo zypper install firefox vscode git gh-cli trash-cli zsh btop
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
}

Main
>>>>>>> 1212ef6 (setup addec)
