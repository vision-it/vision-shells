# This file is managed by Puppet; All changes will be undone

alias e='emacs -nw'
alias shipit='puppet agent -t'
alias deploy='r10k deploy environment -pv'
alias upgrade='apt update && apt upgrade && apt-get autoremove && apt-get clean'
alias postrun='/etc/puppetlabs/r10k/postrun/postrun.py'
alias bconsole='docker exec -it bareos-director bconsole'