{ ... }:
{
  settings.disko.additionalSubVolumes = {
    "/home/work" = {
      mountpoint = "/home/work";
      mountOptions = [
        "compress=zstd"
        "noatime"
      ];
    };
  };

  users.users.work = {
    isNormalUser = true;
    description = "Work";
    extraGroups = [
      "wheel"
      "video"
      "network"
      "power"
      "audio"
      "disk"
      "input"
      "kvm"
      "docker"
    ];
  };
}
