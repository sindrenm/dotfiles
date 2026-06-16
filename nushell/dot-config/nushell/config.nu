source ./themes/catppuccin/latte.nu

use std/util "path add"

use ~/.config/nushell/functions/from-interrupts.nu *
use ~/.config/nushell/functions/jj-bms.nu *
use ~/.config/nushell/functions/jj-gh-pr-create.nu *
use ~/.config/nushell/functions/theme-pref.nu *

# Shell aliases
alias l = eza;
alias ll = eza --long --git --icons;
alias lt = eza --long --git --icons --tree;
alias lt2 = eza --long --git --icons --tree --level 2;

path add "/opt/android-sdk/platform-tools/"
path add "~/.cargo/bin/"
path add "~/.local/bin/"
path add "~/.pyenv/shims/"

# Source shell hooks

mkdir ($nu.data-dir | path join "vendor/autoload")

let shell_hooks = {
  atuin: { atuin init nu },
  carapace: { carapace _carapace nushell },
  ha: { ha completions nushell },
  starship: { starship init nu },
  zoxide: { zoxide init nushell },
}

for hook in ($shell_hooks | transpose name init) {
  if (which $hook.name | is-not-empty) {
    do $hook.init | save -f ($nu.data-dir | path join $"vendor/autoload/($hook.name).nu")
  }
}
