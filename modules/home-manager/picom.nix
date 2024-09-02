{ ... }:
{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;
    shadow = false;
    fade = true;
    fadeSteps = [ 0.1 0.05 ];
  };
}
