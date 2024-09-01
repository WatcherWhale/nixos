{ ... }:
let
  homeDir = builtins.getEnv "HOME";
in
{
  xdg.configFile."zellij/config.kdl".text = # kdl
    ''
      // If you'd like to override the default keybindings completely, be sure to change "keybinds" to "keybinds clear-defaults=true"
      keybinds {
          normal {
              // uncomment this and adjust key if using copy_on_select=false
              // bind "Alt c" { Copy; }
          }
          locked {
              bind "Ctrl g" { SwitchToMode "Normal"; }
          }
          resize {
              bind "Ctrl n" { SwitchToMode "Normal"; }
              bind "h" "Left" { Resize "Increase Left"; }
              bind "j" "Down" { Resize "Increase Down"; }
              bind "k" "Up" { Resize "Increase Up"; }
              bind "l" "Right" { Resize "Increase Right"; }
              bind "H" { Resize "Decrease Left"; }
              bind "J" { Resize "Decrease Down"; }
              bind "K" { Resize "Decrease Up"; }
              bind "L" { Resize "Decrease Right"; }
              bind "=" "+" { Resize "Increase"; }
              bind "-" { Resize "Decrease"; }
          }
          pane {
              bind "Ctrl p" { SwitchToMode "Normal"; }
              bind "h" "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
              bind "l" "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
              bind "j" "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
              bind "k" "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
              bind "p" { SwitchFocus; SwitchToMode "Normal"; }
              bind "n" { NewPane; SwitchToMode "Normal"; }
              bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
              bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
              bind "x" { CloseFocus; SwitchToMode "Normal"; }
              bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
              unbind "z"
              //bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
              bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
              bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
              bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
              bind "Ctrl n" { SwitchToMode "Resize"; }
              bind "Ctrl m" { SwitchToMode "Move"; }
          }
          move {
              bind "Ctrl h" { SwitchToMode "Normal"; }
              bind "n" "Tab" { MovePane; }
              bind "p" { MovePaneBackwards; }
              bind "h" "Left" { MovePane "Left"; }
              bind "j" "Down" { MovePane "Down"; }
              bind "k" "Up" { MovePane "Up"; }
              bind "l" "Right" { MovePane "Right"; }
          }
          tab {
              bind "Ctrl t" { SwitchToMode "Normal"; }
              bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
              bind "h" "Left" "Up" "k" { GoToPreviousTab; SwitchToMode "Normal"; }
              bind "l" "Right" "Down" "j" { GoToNextTab; SwitchToMode "Normal"; }
              bind "n" { NewTab; SwitchToMode "Normal"; }
              bind "x" { CloseTab; SwitchToMode "Normal"; }
              bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
              bind "b" { BreakPane; SwitchToMode "Normal"; }
              bind "]" { BreakPaneRight; SwitchToMode "Normal"; }
              bind "[" { BreakPaneLeft; SwitchToMode "Normal"; }
              //unbind "a"
              //bind "a" { NewTab {
              //      layout "${homeDir}/.config/zellij/layouts/aloxy.kdl"
              //  }; SwitchToMode "Normal";}
              bind "9" { NewTab {
                      name "k9s"
                      layout "${homeDir}/.config/zellij/layouts/k9s.kdl"
                  }; SwitchToMode "Normal";}
              bind "Tab" { ToggleTab; }
              bind "y" {
                  LaunchOrFocusPlugin "file:${homeDir}/.config/zellij/plugins/room.wasm" {
                      floating true
                      ignore_case true
                  }; SwitchToMode "Normal";
              }
          }
          scroll {
              bind "Ctrl s" { SwitchToMode "Normal"; }
              bind "e" { EditScrollback; SwitchToMode "Normal"; }
              bind "/" { SwitchToMode "EnterSearch"; SearchInput 0; }
              bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
              bind "j" "Down" { ScrollDown; }
              bind "k" "Up" { ScrollUp; }
              bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
              bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
              bind "d" { HalfPageScrollDown; }
              bind "u" { HalfPageScrollUp; }
              // uncomment this and adjust key if using copy_on_select=false
              // bind "Alt c" { Copy; }
          }
          search {
              bind "Ctrl s" { SwitchToMode "Normal"; }
              bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
              bind "j" "Down" { ScrollDown; }
              bind "k" "Up" { ScrollUp; }
              bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
              bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
              bind "d" { HalfPageScrollDown; }
              bind "u" { HalfPageScrollUp; }
              bind "n" { Search "down"; }
              bind "N" { Search "up"; }
              bind "p" { Search "up"; }
              bind "c" { SearchToggleOption "CaseSensitivity"; }
              bind "w" { SearchToggleOption "Wrap"; }
              bind "o" { SearchToggleOption "WholeWord"; }
          }
          entersearch {
              bind "Ctrl c" "Esc" { SwitchToMode "Scroll"; }
              bind "Enter" { SwitchToMode "Search"; }
          }
          renametab {
              bind "Ctrl c" { SwitchToMode "Normal"; }
              bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
          }
          renamepane {
              bind "Ctrl c" { SwitchToMode "Normal"; }
              bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
          }
          session {
              bind "Ctrl o" { SwitchToMode "Normal"; }
              bind "Ctrl s" { SwitchToMode "Scroll"; }
              bind "d" { Detach; }
              bind "w" {
                  LaunchOrFocusPlugin "zellij:session-manager" {
                      floating true
                      move_to_focused_tab true
                  };
                  SwitchToMode "Normal"
              }
          }
          tmux {
              bind "[" { SwitchToMode "Scroll"; }
              bind "Ctrl b" { Write 2; SwitchToMode "Normal"; }
              bind "\"" { NewPane "Down"; SwitchToMode "Normal"; }
              bind "%" { NewPane "Right"; SwitchToMode "Normal"; }
              bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
              bind "c" { NewTab; SwitchToMode "Normal"; }
              bind "," { SwitchToMode "RenameTab"; }
              bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
              bind "n" { GoToNextTab; SwitchToMode "Normal"; }
              bind "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
              bind "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
              bind "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
              bind "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
              bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
              bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
              bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
              bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
              bind "o" { FocusNextPane; }
              bind "d" { Detach; }
              bind "Space" { NextSwapLayout; }
              bind "x" { CloseFocus; SwitchToMode "Normal"; }
          }
          shared_except "locked" {
              bind "Ctrl g" { SwitchToMode "Locked"; }
              unbind "Ctrl q"
              //bind "Ctrl q" { Quit; }
              bind "Alt n" { NewPane; }
              bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
              bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
              bind "Alt j" "Alt Down" { MoveFocus "Down"; }
              bind "Alt k" "Alt Up" { MoveFocus "Up"; }
              bind "Alt =" "Alt +" { Resize "Increase"; }
              bind "Alt -" { Resize "Decrease"; }
              bind "Alt [" { PreviousSwapLayout; }
              bind "Alt ]" { NextSwapLayout; }
          }
          shared_except "normal" "locked" {
              bind "Enter" "Esc" { SwitchToMode "Normal"; }
          }
          shared_except "pane" "locked" {
              bind "Ctrl p" { SwitchToMode "Pane"; }
          }
          shared_except "resize" "locked" {
              bind "Ctrl n" { SwitchToMode "Resize"; }
          }
          shared_except "scroll" "locked" {
              bind "Ctrl s" { SwitchToMode "Scroll"; }
          }
          shared_except "session" "locked" {
              unbind "Ctrl o"
              //bind "Ctrl s" { SwitchToMode "Session"; }
          }
          shared_except "tab" "locked" {
              bind "Ctrl t" { SwitchToMode "Tab"; }
          }
          shared_except "move" "locked" {
              unbind "Ctrl h"
              //bind "Ctrl H" { SwitchToMode "Move"; }
          }
          shared_except "tmux" "locked" {
              unbind "Ctrl b"
              //bind "Ctrl b" { SwitchToMode "Tmux"; }
          }
      }

      plugins {
          tab-bar { path "tab-bar"; }
          status-bar { path "status-bar"; }
          strider { path "strider"; }
          compact-bar { path "compact-bar"; }
          session-manager { path "session-manager"; }
      }

      // Choose what to do when zellij receives SIGTERM, SIGINT, SIGQUIT or SIGHUP
      // eg. when terminal window with an active zellij session is closed
      // Options:
      //   - detach (Default)
      //   - quit
      //
      on_force_close "quit"

      //  Send a request for a simplified ui (without arrow fonts) to plugins
      //  Options:
      //    - true
      //    - false (Default)
      //
      simplified_ui true

      // Choose the path to the default shell that zellij will use for opening new panes
      // Default: $SHELL
      //
      default_shell "fish"

      // Choose the path to override cwd that zellij will use for opening new panes
      //
      // default_cwd ""

      // Toggle between having pane frames around the panes
      // Options:
      //   - true (default)
      //   - false
      //
      pane_frames false

      // Toggle between having Zellij lay out panes according to a predefined set of layouts whenever possible
      // Options:
      //   - true (default)
      //   - false
      //
      // auto_layout true

      // Choose the theme that is specified in the themes section.
      // Default: default
      //
      themes {
          nord_lol {
              fg 216 222 233 // #D8DEE9
              bg 46 52 64 // #2E3440
              black 59 66 82 // #3B4252
              red 191 97 106 // #BF616A
              green 129 161 193 // #A3BE8C
              yellow 235 203 139 // #EBCB8B
              blue 129 161 193 // #81A1C1
              magenta 180 142 173 // #B48EAD
              cyan 136 192 208 // #88C0D0
              white 229 233 240 // #E5E9F0
              orange 208 135 112 // #D08770
          }
      }
      theme "nord_lol"

      // The name of the default layout to load on startup
      // Default: "default"
      //
      default_layout "whale-compact"

      // Choose the mode that zellij uses when starting up.
      // Default: normal
      //
      // default_mode "locked"

      // Toggle enabling the mouse mode.
      // On certain configurations, or terminals this could
      // potentially interfere with copying text.
      // Options:
      //   - true (default)
      //   - false
      //
      mouse_mode false

      // Configure the scroll back buffer size
      // This is the number of lines zellij stores for each pane in the scroll back
      // buffer. Excess number of lines are discarded in a FIFO fashion.
      // Valid values: positive integers
      // Default value: 10000
      //
      // scroll_buffer_size 10000

      // Provide a command to execute when copying text. The text will be piped to
      // the stdin of the program to perform the copy. This can be used with
      // terminal emulators which do not support the OSC 52 ANSI control sequence
      // that will be used by default if this option is not set.
      // Examples:
      //
      copy_command "xclip -selection clipboard" // x11
      // copy_command "wl-copy"                    // wayland
      // copy_command "pbcopy"                     // osx

      // Choose the destination for copied text
      // Allows using the primary selection buffer (on x11/wayland) instead of the system clipboard.
      // Does not apply when using copy_command.
      // Options:
      //   - system (default)
      //   - primary
      //
      // copy_clipboard "primary"

      // Enable or disable automatic copy (and clear) of selection when releasing mouse
      // Default: true
      //
      // copy_on_select false

      // Path to the default editor to use to edit pane scrollbuffer
      // Default: $EDITOR or $VISUAL
      //
      scrollback_editor "/usr/bin/nvim"

      // When attaching to an existing session with other users,
      // should the session be mirrored (true)
      // or should each user have their own cursor (false)
      // Default: false
      //
      // mirror_session true

      // The folder in which Zellij will look for layouts
      //
      layout_dir "${homeDir}/.config/zellij/layouts"

      // The folder in which Zellij will look for themes
      //
      // theme_dir "/path/to/my/theme_dir"

      ui {
          pane_frames {
              hide_session_name true
          }
      }
    '';
}
