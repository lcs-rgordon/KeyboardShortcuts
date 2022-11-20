//
//  KeyboardShortcutsApp.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

@main
struct KeyboardShortcutsApp: App {
    
    @State private var favouritesList: [Shortcut] = []
    
    var body: some Scene {
        WindowGroup {
            ContentView(favouritesList: $favouritesList)
                .frame(minWidth: 600, idealWidth: 700, minHeight: 500, idealHeight: 700)
        }
        
        WindowGroup("Favourites") {
            FavouritesView(favouritesList: $favouritesList)
                .frame(minWidth: 600, idealWidth: 700, minHeight: 500, idealHeight: 700)
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "Favourites"))
        
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
