//
//  ContentView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import AppKit
import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var selectedShortcut: Int?
    
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

            List(selection: $selectedShortcut) {
                
                ForEach(searchResults.indices, id: \.self) { index in
                    
                    NavigationLink(destination: {
                        ShortcutDetailView(item: searchResults[index],
                                           favouritesList: $favouritesList,
                                           onFavouritesView: false)
                    }, label: {
                        ListItemView(item: searchResults[index]).tag(index)
                    })
                }
                
            }
            // Support keyboard navigation in the list
            // SEE: https://stackoverflow.com/a/73256905/5537362
            .onAppear {
                NSEvent.addLocalMonitorForEvents(matching: [.keyDown]) { nsevent in
                    
                    if selectedShortcut != nil {
                        if nsevent.keyCode == 125 { // arrow down
                            print("moving down")
                            selectedShortcut = selectedShortcut! < searchResults.count ? selectedShortcut! + 1 : 0
                        } else {
                            print("moving up")
                            if nsevent.keyCode == 126 { // arrow up
                                selectedShortcut = selectedShortcut! > 1 ? selectedShortcut! - 1 : 0
                            }
                        }
                    } else {
                        selectedShortcut = 0
                    }
                    return nsevent
                }
            }
            .background(Color.primary.colorInvert())
            .frame(minWidth: 300, idealWidth: 400, maxWidth: 500)
            .searchable(text: $searchText)


        }
        .onChange(of: selectedShortcut) { newSelection in
            print(searchResults[selectedShortcut ?? 0].description ?? "Nothing selected")
        }
        .task {
            // Runs once when app opens
            loadDataFromStorage()
            print("There are this many shortcuts: \(shortcutsList.count)")
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
