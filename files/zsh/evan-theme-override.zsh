# Warning: This file is managed by puppet
# Override the 'evan'-theme to accomidate our FQDN naming scheme

HOST="$(hostname -f | cut -f 1 -d .)"
ENV="$(hostname -f | cut -f 2 -d .)"
LOC="$(facter location.)"

if [[ $ENV == 'dev' ]]; then
    HOSTENV=$HOST'.%{$fg[green]%}dev%{$reset_color%}'
elif [[ $ENV == 'stg' ]]; then
    HOSTENV=$HOST'.%{$fg[yellow]%}stg%{$reset_color%}'
else
    HOSTENV=$HOST'.%{$fg[black]%}%{$bg[red]%}prd%{$reset_color%}'
fi

PROMPT="$HOSTENV ($LOC) :: %2~ %B:%b "