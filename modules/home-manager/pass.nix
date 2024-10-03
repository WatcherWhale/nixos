{ config, ... }:
{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_KEY = "0x7A0C36C38FC417A5";
      PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.local/pass-store";
    };
  };
}
