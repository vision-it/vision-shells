# Class: vision_shells_fish
# ===========================
#
# Install and configure fish
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_shells::fish
#
class vision_shells::fish (

){

  if !defined(Package[ 'fish' ]) {
    package { 'fish':
      ensure   => present,
    }
  }

}
