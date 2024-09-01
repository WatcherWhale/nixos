{ ... }:
{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;

    silent = true;

    config = {
      global = {
        disable_stdin = true;
        load_dotenv = true;
        hide_env_diff = true;
      };
      whitelist = {
        prefix = [ "~/Projects/Aloxy/Aloxy" ];
      };
    };
  };
}
