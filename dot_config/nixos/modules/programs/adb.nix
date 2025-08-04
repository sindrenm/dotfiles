{
  config = {
    programs.adb.enable = true;
    users.users.sindre.extraGroups = [ "adbusers" ];
  };
}
