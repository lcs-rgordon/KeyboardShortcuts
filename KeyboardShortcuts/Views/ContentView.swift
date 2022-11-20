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
    
    // What the user is searching for
    @State private var searchText = ""
    
    // The filtered list of results
    var searchResults: [Shortcut] {
        if searchText.isEmpty {
            return shortcutsList
        } else {
            return shortcutsList.filter { currentShortcut in
                let whetherToIncludeThisShortcut = currentShortcut.description.lowercased().contains(searchText.lowercased()) || currentShortcut.sequence.lowercased().contains(searchText.lowercased())
                
                return whetherToIncludeThisShortcut
            }
        }
    }
    
    var body: some View {
                
        NavigationView {

            List(searchResults, id: \.self, selection: $selectedShortcut) { shortcut in
                
                NavigationLink(destination: {
                    ShortcutDetailView(item: selectedShortcut)
                }, label: {
                    ListItemView(item: shortcut)
                })
                
            }
            .background(Color.primary.colorInvert())
//            .frame(minWidth: 300, idealWidth: 400, maxWidth: 500, idealHeight: 600)
            .searchable(text: $searchText)


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
