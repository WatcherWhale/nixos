{ ... }:
{
  # automatic garbace collection
  nix.gc = {
    automatic = true;
    dates = "hourly";
    options = "--delete-older-than 14d";
  };
}
