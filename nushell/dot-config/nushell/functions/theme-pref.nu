# Get or set the desktop color-scheme preference exposed through the XDG
# Settings portal.
#
# Without an argument, this command reads the current portal value. With an
# argument, it writes via `gsettings` and then re-reads the portal value so the
# reported result matches what apps actually see.
@example "Show the current portal color-scheme preference" { theme-pref }
@example "Set the preference to dark" { theme-pref dark }
@example "Set the preference to light" { theme-pref light }
@example "Clear the preference" { theme-pref no-preference }
export def main [
  preference?: string@"theme-pref-complete" # dark | light | no-preference
]: nothing -> record {
  if $preference == null {
    return (portal-color-scheme)
  }

  let normalized = ($preference | str lowercase | str trim)
  let target = match $normalized {
    "dark" => { portal: "dark", gsettings: "prefer-dark" }
    "light" => { portal: "light", gsettings: "prefer-light" }
    "no-preference" => { portal: "no-preference", gsettings: "default" }
    _ => {
      error make {
        msg: $"Invalid theme preference: ($preference)"
        label: {
          text: "Expected one of: dark, light, no-preference"
          span: (metadata $preference).span
        }
      }
    }
  }

  let before = (portal-color-scheme)

  let write = (
    ^gsettings
      set
      org.gnome.desktop.interface
      color-scheme
      $target.gsettings
    | complete
  )

  if $write.exit_code != 0 {
    error make {
      msg: "Failed to set theme preference via gsettings"
      label: {
        text: ($write.stderr | str trim)
        span: (metadata $write.stderr).span }
    }
  }

  let after = (portal-color-scheme)

  {
    requested: $target.portal
    gsettings_value: $target.gsettings
    portal_before: $before,
    portal_after: $after,
  }
}

def "theme-pref-complete" [] {
  [
    { value: "dark", description: "Set the portal preference to dark" }
    { value: "light", description: "Set the portal preference to light" }
    { value: "no-preference", description: "Clear the portal preference" }
  ]
}

def portal-color-scheme [] {
  let code = (portal-color-scheme-code)
  let name = (portal-color-scheme-name $code)

  {
    code: $code,
    preference: $name
  }
}

def portal-color-scheme-code [] {
  let result = (
    ^gdbus call --session
      --dest org.freedesktop.portal.Desktop
      --object-path /org/freedesktop/portal/desktop
      --method org.freedesktop.portal.Settings.ReadOne
      org.freedesktop.appearance
      color-scheme
    | complete
  )

  if $result.exit_code != 0 {
    error make {
      msg: "Failed to read portal color-scheme"
      label: {
        text: ($result.stderr | str trim)
        span: (metadata $result.stderr).span
      }
    }
  }

  let parsed = ($result.stdout | str trim | parse "(<uint32 {value}>,)")

  if ($parsed | is-empty) {
    error make {
      msg: $"Unexpected portal response: ($result.stdout | str trim)"
    }
  }

  $parsed | get 0.value | into int
}

def portal-color-scheme-name [code: int] {
  match $code {
    0 => "no-preference"
    1 => "dark"
    2 => "light"
    _ => "unknown"
  }
}
