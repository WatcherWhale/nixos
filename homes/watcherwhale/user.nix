{ ... }:
{
  users.users.watcherwhale = {
    isNormalUser = true;
    description = "default user on my machines";
    extraGroups = [ "wheel" "video" "network" "power" "audio" "disk" "input" "kvm" "games" ];
  };
}
