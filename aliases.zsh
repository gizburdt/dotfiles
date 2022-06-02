# General
alias ..="cd .."
alias cpssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias fcli="source $HOME/.zshrc"
alias fdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Short
alias a="php artisan"
alias c="composer"
alias n="npm"
alias y="yarn"
alias s="cd ~/Server"

# Laravel
alias am="php artisan migrate"
alias ams="php artisan migrate --seed"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias arl="php artisan route:list"
alias arlev="php artisan route:list --except-vendor"
alias ael="php artisan event:list"
alias ah="php artisan horizon"
alias ad="php artisan dusk"
alias please="php please"

# Composer
alias cda="composer dump-autoload -o"
alias ci="composer install"
alias cii="composer install --ignore-platform-reqs"
alias cu="composer update"
alias cui="composer update --ignore-platform-reqs"
alias ct="composer test"
alias cf="rm -rf vendor/ && composer install"
alias cfi="rm -rf vendor/ && composer install --ignore-platform-reqs"
alias cff="rm -rf vendor/ composer.lock && composer install"
alias cffi="rm -rf vendor/ composer.lock && composer install --ignore-platform-reqs"

# NPM
alias ni="npm install"
alias nrw="npm run watch --quiet-deps"
alias nrd="npm run dev --quiet-deps"
alias nrp="npm run production"
alias nrs="npm run start"
alias nrsd="npm run start:dev"
alias nf="rm -rf node_modules/ package-lock.json && npm install"

# Yarn
alias yi="yarn install"
alias yb="yarn build"

# Nuxt
alias nx="nuxt"

# PHPUnit
alias pu="./vendor/bin/phpunit"

# Weather
weather() { curl -4 wttr.in/${1:-steenwijk} }

# Code
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# QR
qr() { curl qrcode.show/$1 }

# IDE
ide() {
    php artisan ide-helper:generate
    php artisan ide-helper:models
    php artisan ide-helper:meta
}

# DB
opendb () {
    [ ! -f .env ] && { echo "No .env file found."; exit 1; }

    DB_CONNECTION=$(grep ^DB_CONNECTION .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
    DB_HOST=$(grep ^DB_HOST .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
    DB_PORT=$(grep ^DB_PORT .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
    DB_DATABASE=$(grep ^DB_DATABASE .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
    DB_USERNAME=$(grep ^DB_USERNAME .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
    DB_PASSWORD=$(grep ^DB_PASSWORD .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)

    DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

    echo "Opening ${DB_URL}"
    open $DB_URL
}

# PHP
alias php81="brew unlink php@8.0 php@7.4 && brew link --overwrite --force php"
alias php80="brew unlink php@7.4 php && brew link --overwrite --force php@8.0"
alias php74="brew unlink php@8.0 php && brew link --overwrite --force php@7.4"

# Git
gitbl () {
    for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
}