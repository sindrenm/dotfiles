{
  config = {
    programs.fish.enable = true;

    programs.fish.shellAliases = {
      l = "eza";
      ll = "eza --long --git --icons";
      lt = "eza --long --git --icons --tree";

      g = "git";

      grep = "grep --color=always";
      less = "less -R";
    };
  };
}
