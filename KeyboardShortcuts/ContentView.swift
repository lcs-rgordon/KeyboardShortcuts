//
//  ContentView.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State private var isAnimating = true
    
    var body: some View {
        VStack {
            AnimatedImage(name: "Tabs.gif", isAnimating: $isAnimating)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    isAnimating.toggle()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
