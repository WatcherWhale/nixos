{ ... }:
{
  programs.xob.settings = ''
    brillo = {
        x         = {relative = 0.5; offset = 0;};
        y         = {relative = 0; offset = 58;};
        length    = {relative = 0; offset = 300;};
        thickness = 24;
        outline   = 0;
        border    = 4;
        padding   = 0;
        orientation = "horizontal";

        overflow = "proportional";

        color = {
            normal = {
                fg     = "#ebcb8b";
                bg     = "#2e3440";
                border = "#4c566a";
            };
        };
    };

    audio = {
        x         = {relative = 0.5; offset = 0;};
        y         = {relative = 0; offset = 58;};
        length    = {relative = 0; offset = 300;};
        thickness = 24;
        outline   = 0;
        border    = 4;
        padding   = 0;
        orientation = "horizontal";

        overflow = "proportional";

        color = {
            normal = {
                fg     = "#5e81ac";
                bg     = "#2e3440";
                border = "#4c566a";
            };
            alt = {
                fg     = "#8fbcbb";
                bg     = "#2e3440";
                border = "#4c566a";
            };
        };
    };
  '';
}
