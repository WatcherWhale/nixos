{ ... }:
{
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
    ];
  };
}
