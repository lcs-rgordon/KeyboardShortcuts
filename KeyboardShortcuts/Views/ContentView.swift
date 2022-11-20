//
//  ContentView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var selectedShortcut: Shortcut?
    
    var body: some View {
        
        NavigationView {

            List(shortcutsList, selection: $selectedShortcut) { shortcut in
                
                NavigationLink(destination: {
                    ShortcutDetailView(item: selectedShortcut)
                }, label: {
                    ListItemView(item: shortcut)
                })
                
            }

        }
        .onChange(of: selectedShortcut) { newSelection in
            print(newSelection?.description)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
