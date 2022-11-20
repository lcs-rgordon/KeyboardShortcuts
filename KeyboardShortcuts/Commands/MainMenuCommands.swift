//
//  MainMenuCommands.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import Foundation
import SwiftUI

struct MainMenuCommands: Commands {
    
    // MARK: Environment
    
    // Required to support opening of a new window
    @Environment(\.openURL) var openURL

    
    var body: some Commands {
        
        // MARK: App menu (Keyboard Shortcuts)
        CommandGroup(replacing: CommandGroupPlacement.systemServices) {
            EmptyView()
        }
        
        // MARK: File menu
        CommandGroup(replacing: .newItem) {
            EmptyView()
        }
        
        // MARK: Edit menu

        // Get rid of undo/redo commands
        CommandGroup(replacing: CommandGroupPlacement.undoRedo) {
            EmptyView()
        }

        CommandGroup(replacing: CommandGroupPlacement.textEditing) {
            EmptyView()
        }
        
        CommandGroup(replacing: CommandGroupPlacement.pasteboard) {
            EmptyView()
        }
        


        // MARK: View menu
        CommandGroup(after: .sidebar) {

            // Add Show Favourites command
            Button(action: {
                OpenWindows.favouritesView.open()
            }, label: {
                Text("Show Favourite Shortcuts")
            })
            .keyboardShortcut("F", modifiers: [.command])

            Divider()
        }

        // MARK: Help menu
        
        // Get rid of help item
        CommandGroup(replacing: CommandGroupPlacement.help) {
            EmptyView()
        }

        
    }
    
}
