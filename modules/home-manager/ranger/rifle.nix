{ pkgs, ... }:
{
  "ext pdf, X, flag f" = ''${pkgs.zathura}/bin/zathura -- "$@"'';
  "ext x?html?" = ''nvim -- "$@"'';
  "mime ^text, label editor" = ''nvim -- "$@"'';
  "mime ^audio|ogg$, X, flag f" = ''${pkgs.mpv}/bin/mpv --loop -- "$@"'';
  "mime ^video, X, flag f" = ''${pkgs.mpv}/bin/mpv -- "$@"'';
  "mime ^image, X, flag f" = ''${pkgs.qimgv}/bin/qimgv "$@"'';
}
