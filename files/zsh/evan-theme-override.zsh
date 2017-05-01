# Warning: This file is managed by puppet; DO NOT EDIT
# ====================================================
# Path:          files/zsh/evan-theme-override.zsh
# Last Modified: Fri, 17.06.2016 - 10:04:47

# Override the 'evan'-theme to accomidate our FQDN naming scheme
HOST="$(hostname -f | cut -f 1 -d .)"
ENV="$(hostname -f | cut -f 2 -d .)"
if [[ $ENV == 'dev' ]]; then
    HOSTENV=$HOST'.%{$fg[green]%}dev%{$reset_color%}'
elif [[ $ENV == 'stg' ]]; then
    HOSTENV=$HOST'.%{$fg[yellow]%}stg%{$reset_color%}'
else
    HOSTENV=$HOST'.%{$fg[black]%}%{$bg[red]%}prd%{$reset_color%}'
fi
PROMPT="$HOSTENV :: %2~ %B»%b "
