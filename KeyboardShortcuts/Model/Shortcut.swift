//
//  Shortcut.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import Foundation

struct Shortcut: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let sequence: String
    let description: String
    
    // MARK: Computed properties

    // A list of strings that return matching SF Symbol names for each part of the keyboard shortcut
    var symbols: [String] {
        
        // Get the command sub-parts
        let shortcutParts = sequence.components(separatedBy: CharacterSet(charactersIn: "–-"))
        
        // Start a list of matching symbols
        var symbolNames: [String] = []
        for part in shortcutParts {
            symbolNames.append(symbolsLookup[part] ?? "")
        }
        
        // Break up the sequence using - as a delimiter
        return symbolNames
        
    }
    
}

let symbolsLookup: [String: String] = [

    "1" : "1.square"
    ,

    "2" : "2.square"
    ,

    "3" : "3.square"
    ,

    "4" : "4.square"
    ,

    "A" : "a.square"
    ,

    "Brightness Down" : "sun.min"
    ,

    "Brightness Up" : "sun.max"
    ,

    "C" : "c.square"
    ,

    "click a disclosure triangle" : "chevron.right"
    ,

    "click a window title" : "macwindow"
    ,

    "clicking" : "cursorarrow.click.2"
    ,

    "Command" : "command"
    ,

    "Command key while double" : "command"
    ,

    "Command key while dragging to another volume" : "command"
    ,

    "Command while dragging" : "command"
    ,

    "Control" : "control"
    ,

    "D" : "d.square"
    ,

    "Delete" : "delete.left"
    ,

    "Down Arrow" : "arrowtriangle.down.square"
    ,

    "E" : "e.square"
    ,

    "F" : "f.square"
    ,

    "G" : "g.square"
    ,

    "H" : "h.square"
    ,

    "I" : "i.square"
    ,

    "J" : "j.square"
    ,

    "K" : "k.square"
    ,

    "Keyboard Brightness Down" : "light.min"
    ,

    "Keyboard Brightness Up" : "light.max"
    ,

    "L" : "l.square"
    ,

    "Left Arrow" : "arrowtriangle.backward.square"
    ,

    "Left Bracket ([)" : ""
    ,

    "Mission Control" : ""
    ,

    "N" : "n.square"
    ,

    "O" : "o.square"
    ,

    "Option" : "option"
    ,

    "Option key while double" : "option"
    ,

    "Option key while dragging" : "option"
    ,

    "P" : "p.square"
    ,

    "R" : "r.square"
    ,

    "Right Arrow" : "arrowtriangle.right.square"
    ,

    "Right Bracket (])" : ""
    ,

    "S" : "s.square"
    ,

    "Shift" : "shift"
    ,

    "Slash (/)" : "slash.circle"
    ,

    "T" : "t.square"
    ,

    "U" : "u.square"
    ,

    "Up Arrow" : "arrowtriangle.up.square"
    ,

    "V" : "v.square"
    ,

    "Volume Down" : "speaker.wave.1"
    ,

    "Volume Up" : "speaker.wave.3"
    ,

    "Y" : "y.square"
    ,


]

let shortcutsList = [

    Shortcut(sequence: "Command-D", description: "Duplicate the selected files.")

    ,

    Shortcut(sequence: "Command-E", description: "Eject the selected disk or volume.")

    ,

    Shortcut(sequence: "Command-F", description: "Start a Spotlight search in the Finder window.")

    ,

    Shortcut(sequence: "Command-I", description: "Show the Get Info window for a selected file.")

    ,

    Shortcut(sequence: "Command-R", description: "(1) When an alias is selected in the Finder: show the original file for the selected alias. (2) In some apps, such as Calendar or Safari, refresh or reload the page. (3) In Software Update, check for software updates again.")

    ,

    Shortcut(sequence: "Shift-Command-C", description: "Open the Computer window.")

    ,

    Shortcut(sequence: "Shift-Command-D", description: "Open the desktop folder.")

    ,

    Shortcut(sequence: "Shift-Command-F", description: "Open the Recents window, showing all of the files you viewed or changed recently.")

    ,

    Shortcut(sequence: "Shift-Command-G", description: "Open a Go to Folder window.")

    ,

    Shortcut(sequence: "Shift-Command-H", description: "Open the Home folder of the current macOS user account.")

    ,

    Shortcut(sequence: "Shift-Command-I", description: "Open iCloud Drive.")

    ,

    Shortcut(sequence: "Shift-Command-K", description: "Open the Network window.")

    ,

    Shortcut(sequence: "Option-Command-L", description: "Open the Downloads folder.")

    ,

    Shortcut(sequence: "Shift-Command-N", description: "Create a new folder.")

    ,

    Shortcut(sequence: "Shift-Command-O", description: "Open the Documents folder.")

    ,

    Shortcut(sequence: "Shift-Command-P", description: "Show or hide the Preview pane in Finder windows.")

    ,

    Shortcut(sequence: "Shift-Command-R", description: "Open the AirDrop window.")

    ,

    Shortcut(sequence: "Shift-Command-T", description: "Show or hide the tab bar in Finder windows. ")

    ,

    Shortcut(sequence: "Control-Shift-Command-T", description: "Add selected Finder item to the Dock (OS X Mavericks or later)")

    ,

    Shortcut(sequence: "Shift-Command-U", description: "Open the Utilities folder.")

    ,

    Shortcut(sequence: "Option-Command-D", description: "Show or hide the Dock. ")

    ,

    Shortcut(sequence: "Control-Command-T", description: "Add the selected item to the sidebar (OS X Mavericks or later).")

    ,

    Shortcut(sequence: "Option-Command-P", description: "Hide or show the path bar in Finder windows.")

    ,

    Shortcut(sequence: "Option-Command-S", description: "Hide or show the Sidebar in Finder windows.")

    ,

    Shortcut(sequence: "Command–Slash (/)", description: "Hide or show the status bar in Finder windows.")

    ,

    Shortcut(sequence: "Command-J", description: "Show View Options.")

    ,

    Shortcut(sequence: "Command-K", description: "Open the Connect to Server window.")

    ,

    Shortcut(sequence: "Control-Command-A", description: "Make an alias of the selected item.")

    ,

    Shortcut(sequence: "Command-N", description: "Open a new Finder window.")

    ,

    Shortcut(sequence: "Option-Command-N", description: "Create a new Smart Folder.")

    ,

    Shortcut(sequence: "Command-T", description: "Show or hide the tab bar when a single tab is open in the current Finder window.")

    ,

    Shortcut(sequence: "Option-Command-T", description: "Show or hide the toolbar when a single tab is open in the current Finder window.")

    ,

    Shortcut(sequence: "Option-Command-V", description: "Move the files in the Clipboard from their original location to the current location.")

    ,

    Shortcut(sequence: "Command-Y", description: "Use Quick Look to preview the selected files.")

    ,

    Shortcut(sequence: "Option-Command-Y", description: "View a Quick Look slideshow of the selected files.")

    ,

    Shortcut(sequence: "Command-1", description: "View the items in the Finder window as icons.")

    ,

    Shortcut(sequence: "Command-2", description: "View the items in a Finder window as a list.")

    ,

    Shortcut(sequence: "Command-3", description: "View the items in a Finder window in columns. ")

    ,

    Shortcut(sequence: "Command-4", description: "View the items in a Finder window in a gallery.")

    ,

    Shortcut(sequence: "Command–Left Bracket ([)", description: "Go to the previous folder.")

    ,

    Shortcut(sequence: "Command–Right Bracket (])", description: "Go to the next folder.")

    ,

    Shortcut(sequence: "Command–Up Arrow", description: "Open the folder that contains the current folder.")

    ,

    Shortcut(sequence: "Command–Control–Up Arrow", description: "Open the folder that contains the current folder in a new window.")

    ,

    Shortcut(sequence: "Command–Down Arrow", description: "Open the selected item.")

    ,

    Shortcut(sequence: "Right Arrow", description: "Open the selected folder. This works only when in list view.")

    ,

    Shortcut(sequence: "Left Arrow", description: "Close the selected folder. This works only when in list view.")

    ,

    Shortcut(sequence: "Command-Delete", description: "Move the selected item to the Trash.")

    ,

    Shortcut(sequence: "Shift-Command-Delete", description: "Empty the Trash.")

    ,

    Shortcut(sequence: "Option-Shift-Command-Delete", description: "Empty the Trash without confirmation dialog.")

    ,

    Shortcut(sequence: "Command–Brightness Down", description: "Turn video mirroring on or off when your Mac is connected to more than one display.")

    ,

    Shortcut(sequence: "Option–Brightness Up", description: "Open Displays preferences. This works with either Brightness key.")

    ,

    Shortcut(sequence: "Control–Brightness Up", description: "Increase the brightness of your external display, if supported by your display.")

    ,

    Shortcut(sequence: "Control–Brightness Down", description: "Decrease the brightness of your external display, if supported by your display.")

    ,

    Shortcut(sequence: "Option–Shift–Brightness Down", description: "Adjust the display brightness down in smaller steps. Add the Control key to this shortcut to make the adjustment on your external display, if supported by your display.")

    ,

    Shortcut(sequence: "Option–Shift–Brightness Up", description: "Adjust the display brightness up in smaller steps. Add the Control key to this shortcut to make the adjustment on your external display, if supported by your display.")

    ,

    Shortcut(sequence: "Option–Mission Control", description: "Open Mission Control preferences.")

    ,

    Shortcut(sequence: "Command–Mission Control", description: "Show the desktop. ")

    ,

    Shortcut(sequence: "Control–Down Arrow", description: "Show all windows of the front app.")

    ,

    Shortcut(sequence: "Option–Volume Up", description: "Open Sound preferences. This works with any of the volume keys.")

    ,

    Shortcut(sequence: "Option–Shift–Volume Up", description: "Increase the sound volume in smaller steps.")

    ,

    Shortcut(sequence: "Option–Shift–Volume Down", description: "Decrease the sound volume in smaller steps.")

    ,

    Shortcut(sequence: "Option–Keyboard Brightness Up", description: "Open Keyboard preferences. This works with either Keyboard Brightness key.")

    ,

    Shortcut(sequence: "Option–Shift–Keyboard Brightness Down", description: "Decrease the keyboard brightness in smaller steps.")

    ,

    Shortcut(sequence: "Option–Shift–Keyboard Brightness Up", description: "Increase the keyboard brightness in smaller steps.")

    ,

    Shortcut(sequence: "Option key while double-clicking", description: "Open the item in a separate window, then close the original window.")

    ,

    Shortcut(sequence: "Command key while double-clicking", description: "Open a folder in a separate tab or window.")

    ,

    Shortcut(sequence: "Command key while dragging to another volume", description: "Move the dragged item to the other volume, instead of copying it. ")

    ,

    Shortcut(sequence: "Option key while dragging", description: "Copy the dragged item. The pointer changes while you drag the item.")

    ,

    Shortcut(sequence: "Option-Command while dragging", description: "Make an alias of the dragged item. The pointer changes while you drag the item.")

    ,

    Shortcut(sequence: "Option-click a disclosure triangle", description: "Open all folders within the selected folder. This works only when in list view.")

    ,

    Shortcut(sequence: "Command-click a window title", description: "See the folders that contain the current folder.")

    ,

]
