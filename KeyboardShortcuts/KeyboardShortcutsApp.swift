//
//  KeyboardShortcutsApp.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationWillTerminate(_ notification: Notification) {
        
        print("App is closing...")
        
    }
    
}

@main
struct KeyboardShortcutsApp: App {
    
    // MARK: Stored properties
    @State private var favouritesList: [Shortcut] = []
    
    // Not strictly necessary, but leaving in so that a way to detect app being quit is present
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Detect when app moves between the foreground, background, and inactive states
    @Environment(\.scenePhase) var scenePhase

    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            ContentView(favouritesList: $favouritesList)
                .frame(minWidth: 600, idealWidth: 700, minHeight: 500, idealHeight: 700)
        }
        // Runs when app phase changes
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                
                print("Inactive")
                
            } else if newPhase == .active {
                
                print("Active")
                
            } else if newPhase == .background {
                
                print("Background")
                
                // Permanently save the list of favourite shortcuts
                
                //                persistFlavours()
                
            }
        }
        // Builds menus
        .commands {
            MainMenuCommands()
        }
        
        
        WindowGroup("Favourites") {
            FavouritesView(favouritesList: $favouritesList)
                .frame(minWidth: 600, idealWidth: 700, minHeight: 500, idealHeight: 700)
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "Favourites"))
        // For opening another window, see this post:
        // https://developer.apple.com/forums/thread/651592?answerId=680951022#680951022
        
    }
    
    // MARK: Initializers
    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
    
}

enum OpenWindows: String, CaseIterable {
    case favouritesView = "Favourites"

    func open(){
        if let url = URL(string: "KeyboardShortcuts://\(self.rawValue)") {
            NSWorkspace.shared.open(url)
        }
    }
}
