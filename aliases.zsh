alias ..="cd .."

# General
alias cpssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias fcli="source $HOME/.zshrc"
alias fdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Dotfiles
alias cdot="cd ~/.dotfiles"
alias edot="sublime ~/.dotfiles"

# PHP
alias composer="herd composer"
alias php="herd php"

# Short
alias a="php artisan"
alias c="composer"
alias p="pest"
alias n="npm"
alias cl="claude"
alias s="cd ~/Server"

# Laravel
alias am="php artisan migrate"
alias ams="php artisan migrate --seed"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias amr="php artisan migrate:rollback"
alias amre="amr && am"
alias arl="php artisan route:list --except-vendor"
alias arliv="php artisan route:list"
alias acc="php artisan cache:clear"
alias ael="php artisan event:list"
alias ans="php artisan native:serve"
alias anm="php artisan native:migrate"
alias ah="php artisan horizon"
alias ahc="php artisan horizon:clear"
alias ad="php artisan dusk"
alias at="php artisan test"
alias adoc="php artisan docs"

# Composer
alias cda="composer dump-autoload -o"
alias ci="composer install"
alias cii="composer install --ignore-platform-reqs"
alias cu="composer update"
alias cui="composer update --ignore-platform-reqs"
alias cb="composer bump"
alias ct="composer test"
alias cbu="composer bump && composer update"
alias cf="rm -rf vendor/ && composer install"
alias cfi="rm -rf vendor/ && composer install --ignore-platform-reqs"
alias cff="rm -rf vendor/ composer.lock && composer install"
alias cffi="rm -rf vendor/ composer.lock && composer install --ignore-platform-reqs"

# Pest
alias pp="pest --parallel --order-by random"
alias pps="pest --parallel --order-by random --stop-on-error"
alias pc="herd coverage ./vendor/bin/pest --coverage"
alias pcr="herd coverage ./vendor/bin/pest --coverage-html reports/"
alias pcro="open reports/index.html"

# Docker
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# NPM
alias ni="npm install"
alias nrp="npm run production"
alias nrb="npm run build"
alias nrw="nrp && npm run watch --quiet-deps"
alias nrd="nrb && npm run dev --quiet-deps"
alias nrs="npm run start"
alias nrsd="npm run start:dev"
alias nf="rm -rf node_modules/ package-lock.json && npm install"

# Git
alias push="git push"
alias pull="git pull"
alias wip="commit wip"
alias wipp="commit wip && push"

# Other
alias please="php please"
alias st="sitestein"
alias stp="sitestein publish"
alias mei="meilisearch"
