{ ... }:
{
  users.users.work = {
    isNormalUser = true;
    description = "Work user";
    extraGroups = [ "wheel" "video" "network" "power" "audio" "disk" "input" "kvm" ];
  };
}
