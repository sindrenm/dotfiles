$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.BUN_INSTALL = "~/.local"
$env.EDITOR = "nvim"
$env.MANPAGER = "nvim +Man!"
$env.NH_FLAKE = "/home/sindre/nixos-config"

# Load private environment config if it exists
const private_file = $nu.default-config-dir | path join "env.private.nu"
const private_file = if ($private_file | path exists) { $private_file } else { null }
source-env $private_file
