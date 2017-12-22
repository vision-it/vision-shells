# Class: vision_shells_zsh
# ===========================
#
# Install and configure zsh
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_shells::zsh
#
class vision_shells::zsh (

  Boolean $manage_zsh_package,
  String  $zsh_package_name,

){

  if $manage_zsh_package {
    package { $zsh_package_name:
      ensure => present,
      before => Ohmyzsh::Install['root'],
    }
  }

  ::ohmyzsh::install { 'root':
    set_sh              => true,
    disable_auto_update => true,
  }

  ::ohmyzsh::theme { 'root':
    theme   => 'evan',
  }

  file { '/root/.oh-my-zsh/custom/puppet.zsh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => file('vision_shells/zsh/zsh_completion.zsh'),
    require => File['/root/.oh-my-zsh/custom'],
  }

  file { '/root/.oh-my-zsh':
    ensure  => directory,
    require => Ohmyzsh::Install['root']
  }

  file { '/root/.oh-my-zsh/custom':
    ensure  => directory,
    require => File['/root/.oh-my-zsh']
  }

  file { '/root/.oh-my-zsh/custom/themes':
    ensure  => directory,
    require => File['/root/.oh-my-zsh/custom'],
  }

  file { '/root/.oh-my-zsh/custom/themes/evan.zsh-theme':
    ensure  => present,
    content => file('vision_shells/zsh/evan-theme-override.zsh'),
  }

  file { '/root/.oh-my-zsh/custom/path.zsh':
    ensure  => present,
    content => 'export PATH="/opt/puppetlabs/bin:$PATH"',
    require => File['/root/.oh-my-zsh/custom'],
  }

  file { '/root/.oh-my-zsh/custom/aliases.zsh':
    ensure  => present,
    content => file('vision_shells/zsh/aliases.zsh'),
    require => File['/root/.oh-my-zsh/custom'],
  }

}
