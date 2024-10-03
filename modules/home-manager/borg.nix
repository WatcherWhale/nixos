{ config, pkgs, ... }:
let
  user = config.home.username;
  homePath = config.home.homeDirectory;
in
{
  services.borgmatic = {
    enable = false;
  };

  programs.borgmatic = {
    enable = false;

    backups."${user}" = {
      storage.encryptionPasscommand = "${pkgs.password-store}/bin/pass borg-repo";

      retention = {
        keepHourly = 24;
        keepDaily = 7;
        keepWeekly = 4;
        keepMonthly = 12;
        keepYearly = 1;
      };

      location = {
        sourceDirectories = [
          homePath
        ];

        excludeHomeManagerSymlinks = true;

        repositories = [
          {
            "path" = "${homePath}/.backups/borg";
            "label" = "local";
          }
        ];
      };
    };
  };
}
