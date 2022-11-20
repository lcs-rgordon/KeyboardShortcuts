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

            List(shortcutsList, id: \.self, selection: $selectedShortcut) { shortcut in
                
                NavigationLink(destination: {
                    ShortcutDetailView(item: selectedShortcut)
                }, label: {
                    ListItemView(item: shortcut)
                })
                
            }
            .frame(minWidth: 300, idealWidth: 400, maxWidth: 400)
            

        }
        .onChange(of: selectedShortcut) { newSelection in
            print(newSelection?.description ?? "Nothing selected")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
