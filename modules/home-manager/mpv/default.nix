{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      keep-open = true;
      player-operation-mode = "pseudo-gui";
      save-position-on-quit = "";

      volume = 80;

      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";

      no-keepaspect-window = "";
    };

    bindings = {
      l = "seek 5";
      h = "seek -5";

      j = "add volume -2";
      k = "add volume 2";
      J = "add speed -0.1";
      K = "add speed 0.1";

      s = "playlist-shuffle";
    };
  };

  xdg.configFile."mpv/scripts/show_progress.lua".source = ./show_progress.lua;
}
