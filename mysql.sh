#!/bin/sh

choices=("install" "remove" "start")

select answer in "${choices[@]}"; do
    for item in "${choices[@]}"; do
        if [[ $item == $answer ]]; then
            break 2
        fi
    done
done

if [ "$answer" == "start" ]; then
    brew services start mysql
fi

if [ "$answer" == "remove" ]; then
    echo "Removing..."

    ps -ax | grep mysql

    # Stop
    brew services stop mysql
    brew remove mysql
    brew cleanup

    # Remove
    sudo rm /usr/local/mysql
    sudo rm -rf /usr/local/var/mysql
    sudo rm -rf /usr/local/mysql*
    sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    sudo rm -rf /Library/StartupItems/MySQLCOM
    sudo rm -rf /Library/PreferencePanes/My*

    # LaunchAgent
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

    # Remove
    rm -rf ~/Library/PreferencePanes/My*
    sudo rm -rf /Library/Receipts/mysql*
    sudo rm -rf /Library/Receipts/MySQL*
    sudo rm -rf /private/var/db/receipts/*mysql*/

    # Reboot
    echo "Reboot!"
    sudo reboot
fi

if [ "$answer" == "install" ]; then
    echo "Installing..."

    sudo rm -rf /usr/local/var/mysql/*

    # Brew
    brew doctor
    brew update
    brew install mysql
    brew link mysql --force

    unset TMPDIR

    mysqld -initialize --verbose --user=whoami --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

    brew services start mysql
fi
