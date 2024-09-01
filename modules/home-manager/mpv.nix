{ pkgs, ... }:
let
  show_progress = pkgs.writers.writeLua "show_progress" ''
    -- from https://github.com/mpv-player/mpv/issues/6592#issuecomment-488269456
    function on_pause_show_osc(name, value)
        if value == true then
            mp.command("no-osd set osd-level 0; script-message osc-visibility always")
            reset_osd()
        else
            mp.command("no-osd set osd-level 0; script-message osc-visibility auto")
            reset_osd()
        end
    end

    -- For some reason `set osd-level 0; script-message osc-visibility always; no-osd set osd-level 1` does not work.
    -- The OSC messages `OSC visibility: always/auto` are still displayed.
    -- It's as if `no-osd set osd-level 1` runs before `script-message osc-visibility always` is run/displayed.`¯\_(ツ)_/¯`
    -- As a workaround, I have to make the osd visible after a 1 second timeout.
    -- Why? No idea. Bugs?`¯\_(ツ)_/¯`
    function reset_osd()
        mp.add_timeout(1,
            function()
                mp.command("no-osd set osd-level 1")
            end
        )
    end

    mp.observe_property("pause", "bool", on_pause_show_osc)
  '';
in
{
  programs.mpv = {
    enable = true;
    config = {
      keep-open = true;
      player-operation-mode = "pseudo-gui";
      save-position-on-quit = true;

      volume = 80;

      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";

      no-keepaspect-window = true;
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

    scripts = [
      show_progress
    ];
  };
}
