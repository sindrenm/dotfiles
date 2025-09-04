# Output `jj bookmark list` as a nu table
def "jj bms" [] {
  jj bookmark list | lines | parse "{name}: {change_id} {commit_id} {description}"
}

# Source shell hooks

mkdir ($nu.data-dir | path join "vendor/autoload")

carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
