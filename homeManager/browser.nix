{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "nl"
    ];

    profiles.defaultProfile = {
      name = "Default Profile";
      isDefault = true;

      containersForce = true;
      containers = {
        developing = {
          id = 0;
          name = "Developing";
          color = "green";
          icon = "circle";
        };

        trackingHell = {
          id = 1;
          name = "Tracking Hell";
          color = "orange";
          icon = "fence";
        };

        "personal" = {
          id = 2;
          name = "Personal";
          color = "blue";
          icon = "chill";
        };
      };

      userChrome = ''
        #TabsToolbar {
          display: none;
        }
        #sidebar-header {
          display: none;
        }
      '';

      search = {
        force = true;
        default = "Brave";
        privateDefault = "Brave";
        order = [
          "Brave"
          "Nix Packages"
        ];
        engines = {
          "Brave" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
          };
          "Bing".metaData.hidden = true;
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
      };

    };
  };

  home.packages = with pkgs; [
    brave
  ];
}
