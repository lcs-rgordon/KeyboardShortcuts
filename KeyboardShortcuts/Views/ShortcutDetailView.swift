//
//  ShortcutDetailView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

struct ShortcutDetailView: View {
    
    let item: Shortcut?
    
    var body: some View {
        
        if let item = item {
            
            VStack {
                ListItemView(item: item)
                    .padding(.top)
                
                Spacer()
                
                ShortcutAnimationView(animation: item.animation)
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
        ShortcutDetailView(item: shortcutsList.first!)
    }
}
