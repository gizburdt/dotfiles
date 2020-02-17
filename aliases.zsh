# General
alias cpssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias fcli="source $HOME/.zshrc"
alias fdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Short
alias a="php artisan"
alias c="composer"
alias g="gulp"
alias n="npm"

# Laravel
alias amr="php artisan migrate:refresh"
alias ams="php artisan migrate --seed"
alias amrs="php artisan migrate:refresh --seed"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias arl="php artisan route:list"
alias dusk="php artisan dusk"

# Composer
alias cda="composer dump-autoload -o"
alias ci="composer install --ignore-platform-reqs"
alias cu="composer update --ignore-platform-reqs"
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

# PHP
phpv() {
    valet stop
    brew unlink php@5.6 php@7.2 php@7.3
    brew link --force --overwrite $1
    brew services start $1
    composer global update
    rm -f ~/.config/valet/valet.sock
    valet install
}

alias php56="phpv php@5.6"
alias php72="phpv php@7.2"
alias php73="phpv php@7.3"
alias php74="phpv php"