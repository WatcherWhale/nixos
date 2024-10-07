{ config, ... }:
{
  programs.nushell = {
    enable = true;
    configFile.text = # nu
      ''
        $env.config = {
          show_banner: false,
          table: {
            mode: compact
          },

          edit_mode : "vi",
        }

        def s [args] {
          switcher $args
        }

        def git-home [] {
          cd (git rev-parse --show-toplevel)
        }
      '';

    shellAliases = {
      g = "git";
      pushmr = "git push -o merge_request.create";
      push = "git push";
      pull = "git pull";
      gsc = "git switch -c";
      gf = "git fetch";

      d = "docker";
      drit = "docker run --rm -it";
      dr = "docker run --rm";

      r = "ranger";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      ls = "eza -l --git --icons --time-style '+%Y-%m-%d %H:%M' -s type";
      cp = "cp -i";

      cb = "xclip -selection clipboard";
      cbo = "xclip -o clipboard";

      cat = "bat";

      nix-shell = "nix-shell --run (which nu)";

      # Vim
      v = "nvim";
      vim = "nvim";
      svim = "sudo -e";

      base64 = "base64 -w 0";
      b64 = "base64 -w 0";

      search = "grep -rnw . -e ";

      tf = "terraform";
      ap = "ansible-playbook";

      # Docker
      dfimage = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage";

      ssh = "env TERM=xterm-256color ssh";

      #venvactivate = "source ./.venv/bin/activate.fish";
      rm = "trash";

      ytmp3 = ''yt-dlp -f bestaudio -x --sponsorblock-remove all --audio-format mp3 --embed-thumbnail --add-metadata -i -o "%(autonumber)s %(title)s.%(ext)s"'';

      # Git
      master = "git-default-branch";
      ch = "git-change";
      ghome = "git-home";
      gh = "git-home";
    };
  };

  programs.starship.enableNushellIntegration = true;
}
