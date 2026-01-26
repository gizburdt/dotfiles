# Commit
commit() {
    commitMessage="$*"
    git add .
    eval "git commit -a -m '${commitMessage}'"
}

# IDE
storm() { open -a /Applications/PhpStorm.app --args $* }
strom() { storm --args $* }
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Weather
weather() { curl -4 wttr.in/${1:-steenwijk} }

# QR
qr() { curl qrcode.show/$1 }
