# This file is managed by Puppet; All changes will be undone

alias e='zile'
alias shipit='puppet agent -t'
alias deploy='g10k -quiet -maxworker 10 -config /etc/puppetlabs/r10k/g10k.yaml'
alias deploy_r10k='r10k deploy environment -pv'
alias upgrade='apt update && apt upgrade && apt-get autoremove && apt-get clean'
alias apply="/opt/puppetlabs/bin/puppet apply --test /etc/puppetlabs/code/environments/production/manifests/site.pp"
