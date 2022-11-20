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
                        }, label: {
                            Text("Remove from Favourites")
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                } else {
                    HStack {
                        Button(action: {
                            // Blindly add the current item to the list of favourites, regardless of whether it's there already or not
                            favouritesList.append(item)
                        }, label: {
                            Text("Add to Favourites")
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                    }

                }
                
                Spacer()
                
                ShortcutAnimationView(animation: item.animation)
                
                Spacer()
                
                Button(action: {
                    OpenWindows.favouritesView.open()
                }, label: {
                    Text("Show Favourites")
                })
                .padding(.bottom, 20)
            }
            
            
        } else {
            Text("Please select a shortcut.")
                .font(.largeTitle)
                .foregroundColor(.secondary)
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
