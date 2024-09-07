{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "exit-options-qtile" ''
      declare -A icons=( ["Lock"]="lock" ["Logout"]="system-log-out" ["Restart"]="system-reboot" ["Shutdown"]="system-shutdown" ["Sleep"]="sleep")

      choice="$(echo -e "Lock\0icon\x1flock\nLogout\0icon\x1fsystem-log-out\nRestart\0icon\x1fsystem-reboot\nShutdown\0icon\x1fsystem-shutdown\nSleep\0icon\x1fsleep" | rofi -lines 5 -dmenu -i -p '')"

      if [ "$choice" != "" ]; then

          confirm="$(echo -e "Cancel\0icon\x1ferror\n$choice\0icon\x1f$\{icons[$choice]\}" | rofi -dmenu -i -p '')"

          echo $choice
          echo $confirm

          if [ "$confirm" == $choice ]; then
              if [ "$choice" == "Logout" ]; then
                  qtile cmd-obj -o cmd -f shutdown &
                  sleep 3
                  killall qtile
              elif [ "$choice" == "Restart" ]; then
                  qtile cmd-obj -o cmd -f shutdown &
                  systemctl reboot
              elif [ "$choice" == "Shutdown" ]; then
                  qtile cmd-obj -o cmd -f shutdown &
                  systemctl poweroff
              elif [ "$choice" == "Lock" ]; then
                  ~/.scripts/lock
                  #dm-tool lock
              elif [ $choice == "Sleep" ]; then
                  systemctl suspend
              fi
          fi
      fi
    '')
  ];

}
