{ ... }:
{
  home.keyboard = {
    options = [ "caps:escape" ];
  };

  home.sessionPath = [
    "$HOME/.scripts"
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
    DIFFPROG = "nvim -d";
    BAT_THEME = "Nord";
    EDITOR = "nvim";
    GOPATH = "$HOME/.local/go";
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
  };
}
