{ ... }:
{
  services.redshift = {
    enable = true;

    latitude = "51.26";
    longitude = "4.40";

    tray = true;

    temperature = {
      day = 6500;
      night = 4500;
    };
  };
}
