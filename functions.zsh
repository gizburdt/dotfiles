# Commit
commit() {
    commitMessage="$*"

    git add .

    if [ "$commitMessage" = "" ]; then
        aicommits
        return
    fi

    eval "git commit -a -m '${commitMessage}'"
}

# Code
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Weather
weather() { curl -4 wttr.in/${1:-steenwijk} }

# QR
qr() { curl qrcode.show/$1 }

# IDE
ideh() {
    php artisan ide-helper:generate -W
    php artisan ide-helper:models -M
    php artisan ide-helper:meta
}
