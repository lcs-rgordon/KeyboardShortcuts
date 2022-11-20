//
//  ShortcutView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShortcutAnimationView: View {
    
    @State private var isAnimating = true
    let animation: String
    
    var body: some View {
        VStack {
            AnimatedImage(name: animation, isAnimating: $isAnimating)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    isAnimating.toggle()
                }
        }
        .padding()
    }
}

struct ShortcutAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutAnimationView(animation: "Tabs.gif")
    }
}
