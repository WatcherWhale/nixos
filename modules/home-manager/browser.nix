{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-GB"
      "nl"
    ];

    policies = {
      DisableAppUpdate = false;
      DisableDeveloperTools = false;
    };

    profiles.default = {
      name = "firefox";
      id = 0;
      isDefault = true;

      # containersForce = false;
      # containers = {
      #   developing = {
      #     id = 1;
      #     name = "Developing";
      #     color = "turquoise";
      #     icon = "circle";
      #   };
      #
      #   trackingHell = {
      #     id = 2;
      #     name = "Tracking Hell";
      #     color = "red";
      #     icon = "fence";
      #   };
      #
      #   "personal" = {
      #     id = 3;
      #     name = "Personal";
      #     color = "blue";
      #     icon = "chill";
      #   };
      # };

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
                { name = "channel"; value = "unstable"; }
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
    inputs.zen-browser.packages."${system}".specific
  ];
}
