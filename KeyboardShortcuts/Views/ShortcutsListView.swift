//
//  ShortcutsListView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

struct ShortcutsListView: View {
    
    @Binding var selectedShortcut: Shortcut?
    
    var body: some View {

        List(shortcutsList, selection: $selectedShortcut) { shortcut in
            ListItemView(item: shortcut)
        }

    }
}

struct ShortcutsListView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutsListView(selectedShortcut: .constant(nil))
    }
}
