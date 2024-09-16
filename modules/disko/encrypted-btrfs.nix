{ lib, config, ... }:
let
  cfg = config.settings.disko;
in
{
  options = {
    settings.disko.additionalSubVolumes = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };

  config = {
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = lib.mkDefault "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1024M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [
                    "defaults"
                  ];
                };
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "root";
                  settings = {
                    allowDiscards = true;
                  };
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = lib.mkMerge [
                      {
                        "/root" = {
                          mountpoint = "/";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };

                        "/home" = {
                          mountpoint = "/home";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };

                        "/nix" = {
                          mountpoint = "/nix";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };

                        "/swap" = {
                          mountpoint = "/.swapvol";
                          swap.swapfile.size = "8G";
                        };
                      }
                      cfg.additionalSubVolumes
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
