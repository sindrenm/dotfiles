{ pkgs, ... }:
{
  config = {
    users.users.sindre = {
      description = "Sindre";
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "kvm"
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        androidStudioPackages.canary
        azure-cli
        bat
        bitwarden-desktop
        btop
        chezmoi
        direnv
        discord
        eza
        fd
        firefox
        fzf
        gh
        git
        gnome-tweaks
        google-chrome
        jujutsu
        kotlin
        lua-language-server
        nerd-fonts.jetbrains-mono
        nil
        nodenv
        pyenv
        rbenv
        rbenv
        rust-analyzer
        rustup
        slack
        starship
        stremio
        typst
        vlc
        vscode-langservers-extracted
        wezterm
        zoxide
        zulu
      ];
    };
  };
}
