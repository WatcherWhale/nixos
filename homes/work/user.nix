{ ... }:
{
  users.users.work = {
    isNormalUser = true;
    description = "Work";
    extraGroups = [ "wheel" "video" "network" "power" "audio" "disk" "input" "kvm" ];
  };
}
