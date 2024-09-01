import os
import pyautogui
from libqtile.config import Group, ScratchPad, Key, KeyChord, Match, Screen, DropDown
from libqtile.log_utils import logger

home = os.path.expanduser("~")

group_names = [" 1", "󰈹 2", " 3", "󰈹 4", "󰠮 5", "󰭷 6", "󰎄 7", "󱃾 8", "󱃾 9", "󱃾 10"]
group_keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

def move_mouse_to_screen(screen):
    pos = ( screen["width"] / 2 + screen["x"], screen["height"] / 2 + screen["y"])
    pyautogui.moveTo(pos[0], pos[1])

def move_mouse(qtile, group_name):
    screen = qtile.groups_map[group_name].screen
    move_mouse_to_screen(qtile.get_screens()[screen.index])

def group_on_screen(qtile, screen):
    return qtile.get_screens()[screen]["group"]

def focus_group(qtile, group_name):
    try:
        qtile.to_screen(qtile.groups_map[group_name].screen.index)
        move_mouse(qtile, group_name)
    except Exception:
        # Lock groups to third screen
        if group_name == group_names[2] or group_name == group_names[6]:
            if len(qtile.get_screens()) >= 3:
                qtile.groups_map[group_name].toscreen(2)
                move_mouse_to_screen(qtile.get_screens()[2])
                return

        qtile.groups_map[group_name].toscreen(toggle=False)


groups = [ Group(i) for i in group_names]

groups[0].layout = "max"
groups[1].layout = "max"
groups[1].matches = [Match(wm_class="firefox")]

groups[2].matches = [Match(wm_class="telegram-desktop"), Match(wm_class="discord-nativefier-6ae157"), Match(wm_class="discord"),
                     Match(wm_class="signal"), Match(wm_class="whatsapp-nativefier-d40211"), Match(wm_class="crx_cifhbcnohmdccbgoicgdjpfamggdegmo"),
                     Match(wm_class="element"), Match(wm_class="thunderbird")]
groups[2].layout = "max"

groups[4].layout = "max"
groups[4].matches = [Match(wm_class="obsidian")]

groups[6].layout = "max"
groups[6].matches = [Match(wm_class="spotify"), Match(wm_class="music_terminal"), Match(wm_class="music"), Match(wm_class="jellyfinmediaplayer"), Match(wm_class="crx_cinhimbnkkaeohfgghhklpknlkffjgod")]

groups[7].layout = "max"
groups[8].layout = "max"
groups[9].layout = "max"

wm_classes = ["spectacle"]

scratchpad = ScratchPad("scratchpad", [
    DropDown(
        "calculator",
        "alacritty -e calculator",
        width=0.8,
        height=0.55,
        opacity=1,
        on_focus_lost_hide=True
    ),
    DropDown(
        "terminal",
        "alacritty",
        width=0.8,
        height=0.55,
        opacity=1,
        on_focus_lost_hide=True
    )
])
scratchpad.matches = [Match(wm_class=i) for i in wm_classes]
groups.append(scratchpad)
