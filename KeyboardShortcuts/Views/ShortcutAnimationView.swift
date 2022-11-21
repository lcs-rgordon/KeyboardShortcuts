//
//  ShortcutView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShortcutAnimationView: View {
    
    let animation: String
    @Binding var isAnimating: Bool
    
    var body: some View {
        AnimatedImage(name: animation, isAnimating: $isAnimating)
            .resizable()
            .aspectRatio(1.5428571429, contentMode: .fit)  // Ensures that image sizes correctly when playing
            .onTapGesture {
                isAnimating.toggle()
            }
            .padding()
    }
}

struct ShortcutAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutAnimationView(animation: "Duplicating Files.gif", isAnimating: .constant(true))
    }
}
