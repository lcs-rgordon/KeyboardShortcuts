//
//  FavouritesView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouritesView: View {
    
    @State var selectedShortcut: Shortcut?
    
    // What the user is searching for
    @State private var searchText = ""
    
    // The list of favourite items
    @Binding var favouritesList: [Shortcut]
    
    // Whether to clear the selected item
    @State private var clearSelectedItem: Bool = false
    
    // The filtered list of results
    var searchResults: [Shortcut] {
        if searchText.isEmpty {
            return favouritesList
        } else {
            return favouritesList.filter { currentShortcut in
                let whetherToIncludeThisShortcut = currentShortcut.description.lowercased().contains(searchText.lowercased()) || currentShortcut.sequence.lowercased().contains(searchText.lowercased())
                
                return whetherToIncludeThisShortcut
            }
        }
    }
    
    var body: some View {
                
        NavigationView {

            if favouritesList.count == 0 {
                List {
                    
                }
                .frame(minWidth: 300, idealWidth: 400, maxWidth: 500)

                Text("Add a shortcut to your Favourites list")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
            } else {
                
                List(searchResults, id: \.self, selection: $selectedShortcut) { shortcut in
                    
                    NavigationLink(destination: {
                        ShortcutDetailView(item: selectedShortcut,
                                           favouritesList: $favouritesList,
                                           onFavouritesView: true)
                    }, label: {
                        ListItemView(item: shortcut)
                    })
                    
                }
                .background(Color.primary.colorInvert())
                .frame(minWidth: 300, idealWidth: 400, maxWidth: 500)
                .searchable(text: $searchText)

            }
            
        }
        .onChange(of: selectedShortcut) { newSelection in
            print(newSelection?.description ?? "Nothing selected")
        }

    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favouritesList: .constant([]))
    }
}
