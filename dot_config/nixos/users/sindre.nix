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
        difftastic
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
        jetbrains.idea-ultimate
        jetbrains.rider
        jujutsu
        kotlin
        lua-language-server
        nerd-fonts.jetbrains-mono
        nil
        nix-direnv
        nodenv
        pyenv
        rbenv
        rust-analyzer
        rustup
        slack
        starship
        stremio
        taplo
        typst
        vlc
        vscode-langservers-extracted
        wezterm
        yaml-language-server
        zoxide
        zulu
      ];
    };
  };
}
