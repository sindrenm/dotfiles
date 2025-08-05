{ pkgs, ... }:
{
  config = {
    system.autoUpgrade.enable = true;

    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 14d";

    nix.settings.auto-optimise-store = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Oslo";
    i18n.defaultLocale = "en_US.UTF-8";

    # Required for PulseAudio/Pipewire
    security.rtkit.enable = true;

    # Enable sound with Pipewire.
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    nixpkgs.config.android_sdk.accept_license = true;

    environment.systemPackages = with pkgs; [
      fish
      wget
      wl-clipboard
    ];
  };
}
