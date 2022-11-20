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
    
    // The list of favourites
    @Binding var favouritesList: [Shortcut]
    
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
                    ShortcutDetailView(item: selectedShortcut,
                                       favouritesList: $favouritesList,
                                       onFavouritesView: false)
                }, label: {
                    ListItemView(item: shortcut)
                })
                
            }
            .background(Color.primary.colorInvert())
            .frame(minWidth: 300, idealWidth: 400, maxWidth: 500)
            .searchable(text: $searchText)


        }
        .onChange(of: selectedShortcut) { newSelection in
            print(newSelection?.description ?? "Nothing selected")
        }
        .task {
            // Runs once when app opens
            loadDataFromStorage()
        }


    }
    
    // MARK: Functions
    func loadDataFromStorage () {
        
        // Get a URL that points to the saved JSON data containing the list of flavours
        let filename = getDocumentsDirectory().appendingPathComponent(fileNameLabel)
                
        // Attempt to load from the stored / persisted file which is in JSON format
        do {
            
            // Load the raw data
            let data = try Data(contentsOf: filename)
            
            // What was loaded from the file?
            print("Got data from persisted file, contents are:")
            print(String(data: data, encoding: .utf8)!)

            // Decode the data into Swift native data structures
            let favouritesLoadedFromDisk = try JSONDecoder().decode([Shortcut].self, from: data)
            
            // What has been loaded into memory?
            print("Data from persisted file now in a list in memory, contents are:")
            print(dump(favouritesLoadedFromDisk))
            
            // Now assign to the source of truth
            favouritesList = favouritesLoadedFromDisk
            
        } catch {
            
            // What went wrong?
            print(error.localizedDescription)
            print("Could not load data from persisted file, favourites list will remain empty.")
            
            print("Contents of favourites list in memory are:")
            print(dump(favouritesList))

        }
        
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(favouritesList: .constant([]))
    }
}
