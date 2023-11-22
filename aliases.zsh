alias ..="cd .."

# General
alias cpssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias fcli="source $HOME/.zshrc"
alias fdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Dotfiles
alias cdot="cd ~/.dotfiles"
alias edot="sublime ~/.dotfiles"

# Short
alias a="php artisan"
alias c="composer"
alias n="npm"
alias s="cd ~/Server"

# Laravel
alias am="php artisan migrate"
alias ams="php artisan migrate --seed"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias amr="php artisan migrate:rollback"
alias arl="php artisan route:list --except-vendor"
alias arliv="php artisan route:list"
alias acc="php artisan cache:clear"
alias ael="php artisan event:list"
alias anv="php artisan native:serve"
alias anm="php artisan native:migrate"
alias ah="php artisan horizon"
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
alias pt="pest --parallel --order-by random"
alias pts="pest --parallel --order-by random --stop-on-error"

# Docker
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# NPM
alias ni="npm install"
alias nrw="npm run watch --quiet-deps"
alias nrd="npm run dev --quiet-deps"
alias nrp="npm run production"
alias nrb="npm run build"
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

###############################################################################
# Functions                                                                   #
###############################################################################

# Git
commitp() { commit "$1"; push; }

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

# Meilisearch
meilisearch() {
    eval "open -a Docker";

    while [[ -z "$(! docker stats --no-stream 2> /dev/null)" ]];
        do printf ".";
        sleep 1
    done

    eval "docker run -it --rm \
        -p 7700:7700 \
        -v $(pwd)/meili_data:/meili_data \
        getmeili/meilisearch"
}

# Weather
weather() { curl -4 wttr.in/${1:-steenwijk} }

# QR
qr() { curl qrcode.show/$1 }

# IDE
ide() {
    php artisan ide-helper:generate -W
    php artisan ide-helper:models -M
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

# Git
gitbl () {
    for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
}