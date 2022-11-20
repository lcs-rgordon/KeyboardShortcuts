//
//  ContentView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    var body: some View {
        List(shortcutsList) { shortcut in
            ListItemView(item: shortcut)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
