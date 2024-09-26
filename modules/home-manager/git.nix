{ pkgs, ... }:
let
  git = "${pkgs.git}/bin/git";
  awk = "${pkgs.gawk}/bin/awk";
  fish = "${pkgs.fish}/bin/fish";
in
{
  programs.git = {
    enable = true;

    userName = "Mathias Maes";

    aliases = rec {
      sync = "!${git} pull && ${git} push";

      garbage-collect-branches = "!${git} fetch -p && for branch in $(${git} branch -vv | grep ': gone]' | ${awk} '{print $1}'); do ${git} branch -D \"$branch\"; done && ${git} gc";
      gcb = "${garbage-collect-branches}";

      change = "!${fish} -c git-change";
      ch = "${change}";
    };

    extraConfig = {
      core = {
        pager = "${pkgs.delta}/bin/delta";
      };

      init = {
        defaultBranch = "master";
      };

      push = {
        autoSetupRemote = true;
      };

      pull = {
        rebase = true;
      };

      merge = {
        conflictstyle = "zdiff3";
        tool = "nvim";
      };

      diff = {
        colorMoved = "default";
        algorithm = "histogram";
      };

      rerere = {
        enabled = true;
      };

      url = {
        "ssh://git@gitlab.com/" = {
          insteadOf = "https://gitlab.com/";
        };

        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      delta = {
        navigate = true;
        # author: https://github.com/anthony-halim;
        dark = true;
        syntax-theme = "Nord";
        file-added-label = "[+]";
        file-copied-label = "[==]";
        file-modified-label = "[*]";
        file-removed-label = "[-]";
        file-renamed-label = "[->]";
        file-style = "omit";
        hunk-header-decoration-style = ''"#5E81AC" ul'';
        hunk-header-file-style = ''blue ul bold'';
        hunk-header-line-number-style = ''yellow box bold'';
        hunk-header-style = ''file line-number syntax bold italic'';
        plus-style = ''brightgreen'';
        plus-emph-style = ''black green'';
        minus-style = ''brightred'';
        minus-emph-style = ''black red'';
        line-numbers = true;
        line-numbers-minus-style = ''brightred'';
        line-numbers-plus-style = ''brightgreen'';
        line-numbers-left-style = "#5E81AC";
        line-numbers-right-style = "#5E81AC";
        line-numbers-zero-style = "#4C566A";
        zero-style = ''syntax'';
        whitespace-error-style = ''black bold'';
        blame-code-style = ''syntax'';
        blame-format = "{author:<18} {commit:<6} {timestamp:<15}";
        blame-palette = ''"#2E3440" "#3B4252" "#434C5E"'';
        merge-conflict-begin-symbol = ''~'';
        merge-conflict-end-symbol = ''~'';
        merge-conflict-ours-diff-header-style = ''yellow bold'';
        merge-conflict-ours-diff-header-decoration-style = ''"#5E81AC" box'';
        merge-conflict-theirs-diff-header-style = ''yellow bold'';
        merge-conflict-theirs-diff-header-decoration-style = ''"#5E81AC" box'';
      };
    };
  };
}
