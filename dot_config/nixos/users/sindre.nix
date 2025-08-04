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
        azure-cli
        bat
        bitwarden-desktop
        btop
        chezmoi
        direnv
        eza
        fd
        firefox
        fzf
        gh
        git
        gnome-tweaks
        google-chrome
        jetbrains-toolbox
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
        wezterm
        zoxide
        zulu
      ];
    };
  };
}
