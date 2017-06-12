# Warning: This file is managed by puppet

# Add a custom config with: menu_complete
# On an ambiguous completion, instead of listing possibilities or beeping,
# insert the first match immediately. Then when completion is requested
# again, remove the first match and insert the second match, etc.
# When there are no more matches, go back to the first one again.
# reverse-menu-complete may be used to loop through the list in the other
# direction
#setopt menu_complete

# Automatically list choices on an ambiguous completion.
#setopt auto_list

# Full fuzzy matching zsh completion engine
# http://superuser.com/a/815317
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

