//
//  ShortcutDetailView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

struct ShortcutDetailView: View {
    
    let item: Shortcut?
    @Binding var favouritesList: [Shortcut]
    let onFavouritesView: Bool
    @State private var isAnimating = true
    
    var animationToggleButton: some View {

        Button(action: {
            isAnimating.toggle()
        }, label: {
            Text(isAnimating ? "Pause Animation" : "Resume Animation")
        })
        .padding(.horizontal)

    }
    
    // Used to toggle whether animation is running or not from the menu
//    @State private var animationActiveTrigger = false
    
    var body: some View {
        
        if let item = item {
            
            VStack {
                ListItemView(item: item)
                    .padding(.top)
                
                if onFavouritesView {
                    HStack {
                        Button(action: {
                            // Remove the current item
                            favouritesList.removeAll(where: { currentShortcutInList in
                                currentShortcutInList.id == item.id
                            })
                            
                            // Save the list of favourites to permanent storage
                            persistFavourites()
                        }, label: {
                            Text("Remove from Favourites")
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        animationToggleButton
                        
                    }
                } else {
                    HStack {
                        Button(action: {
                            // Only add a favourite shortcut if it's not already in the list
                            if !favouritesList.contains(item) {
                                favouritesList.append(item)
                                
                                // Save the list of favourites to permanent storage
                                persistFavourites()
                            }
                        }, label: {
                            Text("Add to Favourites")
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        animationToggleButton

                    }

                }
                
                Spacer()
                
                ShortcutAnimationView(animation: item.animation,
                                      isAnimating: $isAnimating)
                
                Spacer()
                
            }
            // Picks up the toggle of state from the menu command
//            .onChange(of: animationActiveTrigger) { _ in
//                isAnimating.toggle()
//            }
            // Connects the trigger on this page to the menu command
//            .focusedSceneValue(\.animationActiveTriggerBinding, $animationActiveTrigger)

            
            
        } else {
            Text("Please select a shortcut.")
                .font(.largeTitle)
                .foregroundColor(.secondary)
        }
        
    }
    
    // MARK: Functions
    // Save the list of available favourites
    func persistFavourites() {
        
        // Get a URL that points to the saved JSON data containing our list of tasks
        let filename = getDocumentsDirectory().appendingPathComponent(fileNameLabel)
        
        // Try to encode the data in our people array to JSON
        do {
            // Create an encoder
            let encoder = JSONEncoder()
            
            // Ensure the JSON written to the file is human-readable
            encoder.outputFormatting = .prettyPrinted
            
            // Encode the list of ice cream flavours
            let data = try encoder.encode(favouritesList)
            
            // Actually write the JSON file to the documents directory
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            // See the data that was written
            print("Saved data to documents directory successfully.")
            print("===")
            print(String(data: data, encoding: .utf8)!)
            
        } catch {
            
            print(error.localizedDescription)
            print("Unable to write to documents directory in app bundle on device.")
            
        }
        
    }
}

struct ShortcutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutDetailView(item: shortcutsList.first!,
                           favouritesList: .constant([]),
                           onFavouritesView: false)
    }
}
