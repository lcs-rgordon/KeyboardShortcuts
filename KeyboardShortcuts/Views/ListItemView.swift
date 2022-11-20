//
//  ListItemView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

struct ListItemView: View {
    
    @ScaledMetric(relativeTo: .title) var frameWidth = 50
    
    let item: Shortcut
    
    var body: some View {
        VStack {
            HStack {
                Text(item.sequence)
                    .font(.title2)
                
                Spacer()
            }
            HStack {
                Text(item.description)
                    .font(.body)
                
                Spacer()
            }
            HStack {
                ForEach(item.symbols) { symbol in
                    symbol.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: frameWidth, height: frameWidth)
                }
                
                Spacer()
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: shortcutsList.first!)
    }
}
