{ ... }@inputs:
{
  imports = [
    ./kubernetes.nix
  ];

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.fzf = {
    enable = true;

    enableFishIntegration = true;

    defaultOptions = [
      "--height 40%"
      "--layout reverse"
      "--border"
    ];

    colors = {
      fg = "#e5e9f0";
      hl = "#81a1c1";
      "fg+" = "#e5e9f0";
      "bg+" = "#3b4252";
      "hl+" = "#81a1c1";
      info = "#eacb8a";
      prompt = "#bf6069";
      pointer = "#b48dac";
      marker = "#a3be8b";
      spinner = "#b48dac";
      header = "#a3be8b";
    };
  };

  programs.fish = {
    enable = true;

    shellInit = # fish
      ''
        fish_vi_key_bindings
        set fish_cursor_default block
        set fish_cursor_insert line
        set fish_cursor_visual line
        set fish_greeting

        set --unexport COLUMNS
        set --unexport LINES

        set -x K8S_STICKY_FILE "/tmp/kube-sticky-session"

        ${import ./colors.nix inputs}

        bind \ce edit_command_buffer
        bind \cr ranger
      '';

    shellInitLast = # fish
      ''
        switcher init fish | source
        zellij-store | source
        load_sticky
      '';

    functions = {
      "fish_command_not_found" =
        let
          insults = builtins.path {
            name = "insults";
            path = ./insults.txt;
          };
        in
        # fish
        ''
          set_color -o red
          shuf -n 1 ${insults}
          set_color normal
        '';

      "ranger" = # fish
        ''
          command ranger --choosedir=$HOME/.rangerdir $argv; set LASTDIR (cat $HOME/.rangerdir); cd "$LASTDIR"
        '';

      "git-change" = # fish
        ''
          if count $argv > /dev/null
              set ARGS "-q $argv[1]"
          end
          git switch $(git branch --all | tr -d "* " | sed -e "s/remotes\/origin\///g" | sort | uniq | grep -v "HEAD->" | fzf $ARGS)
        '';
      "s" = "kubeswitch $argv;";
    };

    shellAliases = {
      r = "ranger";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      ls = "eza -l --git --icons --time-style '+%Y-%m-%d %H:%M' -s type";
      cp = "cp -i";

      cb = "xclip -selection clipboard";
      cbo = "xclip -o clipboard";

      cat = "bat";

      nix-shell = "nix-shell --run (which fish)";

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
      d = "docker";
      drit = "docker run --rm -it";
      dr = "docker run --rm";
      dfimage = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage";

      ssh = "env TERM=xterm-256color ssh";

      venvactivate = "source ./.venv/bin/activate.fish";
      rm = "trash";

      ytmp3 = "yt-dlp -f bestaudio -x --sponsorblock-remove all --audio-format mp3 --embed-thumbnail --add-metadata -i -o \"%(autonumber)s %(title)s.%(ext)s\"";

      # Git
      g = "git";
      push = "git push";
      pushall = "git pushall";
      commit = "git commit";
      pull = "git pull";
      master = "git switch master";
      ch = "git-change";
      gs = "git switch";
      gsc = "git switch -c";
      ghome = "cd (git rev-parse --show-toplevel)";
      gh = "cd (git rev-parse --show-toplevel)";
      gf = "git fetch";
    };

  };
}