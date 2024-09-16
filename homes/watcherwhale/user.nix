{ ... }:
{
  settings.disko.additionalSubVolumes = {
    "/home/watcherwhale" = {
      mountpoint = "/home/watcherwhale";
      mountOptions = [
        "compress=zstd"
        "noatime"
      ];
    };
    "/home/watcherwhale/Games" = {
      mountpoint = "/home/watcherwhale/Games";
      mountOptions = [
        "compress=zstd"
        "noatime"
        "user"
        "rw"
        "utf8"
        "noauto"
        "umask=000"
      ];
    };
  };

  users.users.watcherwhale = {
    isNormalUser = true;
    description = "WatcherWhale";
    extraGroups = [
      "wheel"
      "video"
      "network"
      "power"
      "audio"
      "disk"
      "input"
      "kvm"
      "games"
      "gamemode"
      "docker"
    ];
  };
}
