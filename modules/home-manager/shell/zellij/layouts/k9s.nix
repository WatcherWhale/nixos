{ ... }:
let
  fileName = "k9s.kdl";
  homeDir = builtins.getEnv "HOME";
in
{
  xdg.configFile."zellij/layouts/${fileName}".text = ''
    layout {
        pane command="fish" {
            args "-c" "zellij_k9s"
        }
        pane size=1 borderless=true {
            //plugin location="zellij:tab-bar"
            plugin location="file:${homeDir}/.config/zellij/plugins/zjstatus.wasm" {
                format_left   "#[bg=#3b4252]{tabs}"
                format_center ""
                format_right  "#[bg=#3b4252]{mode}"
                format_space  "#[bg=#3b4252]"

                mode_normal  ""
                mode_pane "#[bg=#d8dee9,fg=#2e3440] PANE "
                mode_tab "#[bg=#d8dee9,fg=#2e3440] TAB "
                mode_scroll "#[bg=#ebcb8b,fg=#2e3440] SCROLL "

                tab_normal   "#[bg=#434c5e,fg=#d8dee9] {name} "
                tab_active   "#[bg=#81a1c1,fg=#2e3440,bold] {name} "
            }
        }
    }
  '';
}
