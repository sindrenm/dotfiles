mkdir ($nu.data-dir | path join "vendor/autoload")

carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
