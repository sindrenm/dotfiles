{ 
  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };

  hardware.tuxedo-drivers.enable = true;
  boot.kernelParams = [
    "tuxedo_keyboard.mode=0"
    "tuxedo_keyboard.brightness=25"
    "tuxedo_keyboard.color_left=0x0000ff"
  ];
}
