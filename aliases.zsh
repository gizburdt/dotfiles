# General
alias cpssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias fcli="source $HOME/.zshrc"
alias fdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Short
alias a="php artisan"
alias c="composer"
alias g="gulp"
alias n="npm"
alias s="cd ~/Server"

# Laravel
alias amr="php artisan migrate:refresh"
alias ams="php artisan migrate --seed"
alias amrs="php artisan migrate:refresh --seed"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias arl="php artisan route:list"
alias dusk="php artisan dusk"
alias please="php please"

# Composer
alias cda="composer dump-autoload -o"
alias ci="composer install"
alias cii="composer install --ignore-platform-reqs"
alias cu="composer update"
alias cui="composer update --ignore-platform-reqs"
alias ct="composer test"
alias cf="rm -rf vendor/ composer.lock && composer install --ignore-platform-reqs"

# NPM
alias ni="npm install"
alias nrw="npm run watch"
alias nrd="npm run dev"
alias nrp="npm run production"
alias nrs="npm run start"
alias nrsd="npm run start:dev"
alias nf="rm -rf node_modules/ package-lock.json && npm install"

# Nuxt
alias nx="nuxt"

# Adonis
alias ad="adonis"
alias ads="adonis serve"
alias adsd="adonis serve --dev"

# Vagrant
alias vu="vagrant up"

# PHPUnit
alias pu="./vendor/bin/phpunit"

# Weather
weather() { curl -4 wttr.in/${1:-steenwijk} }

# Code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

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
phpv() {
    valet stop
    brew unlink php@7.4 php
    brew link --force --overwrite $1
    brew services start $1
    composer global update
    rm -f ~/.config/valet/valet.sock
    valet install
}

alias php74="phpv php@7.4"
alias php74="phpv php"

# Nova
novaDevtools() {
    cd ./vendor/laravel/nova
    mv webpack.mix.js.dist webpack.mix.js
    npm i
    npm run dev
    rm -rf node_modules
    cd -
    php artisan nova:publish
}