#!/bin/sh

if [ "$1" == "remove" ]; then
    ps -ax | grep mysql
    brew services stop mysql@5.7
    brew services stop mysql
    brew remove mysql@5.7
    brew remove mysql
    brew cleanup
    sudo rm /usr/local/mysql
    sudo rm -rf /usr/local/var/mysql
    sudo rm -rf /usr/local/mysql*
    sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    sudo rm -rf /Library/StartupItems/MySQLCOM
    sudo rm -rf /Library/PreferencePanes/My*
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    rm -rf ~/Library/PreferencePanes/My*
    sudo rm -rf /Library/Receipts/mysql*
    sudo rm -rf /Library/Receipts/MySQL*
    sudo rm -rf /private/var/db/receipts/*mysql*/
    echo "Reboot!"
    sudo reboot
fi

if [ "$1" == "install" ]; then
    sudo rm -rf /usr/local/var/mysql/*
    brew doctor
    brew update
    brew install mysql@5.7
    brew link mysql@5.7 --force
    unset TMPDIR
    mysqld -initialize --verbose --user=whoami --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
    brew services start mysql@5.7
fi