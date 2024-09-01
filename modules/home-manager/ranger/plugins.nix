{ ... }:
{
  "devicons" = builtins.fetchGit {
    url = "https://github.com/alexanderjeurissen/ranger_devicons.git";
    rev = "a8d626485ca83719e1d8d5e32289cd96a097c861";
  };
  "zoxide" = builtins.fetchGit {
    url = "https://github.com/jchook/ranger-zoxide.git";
    rev = "281828de060299f73fe0b02fcabf4f2f2bd78ab3";
  };
}
