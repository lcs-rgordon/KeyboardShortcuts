//
//  FocusedValues.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import SwiftUI

// Structs and extensions used to establish data dependencies between menu commands and view state
// SEE: https://developer.apple.com/forums/thread/651748
// AND: https://swiftwithmajid.com/2021/03/03/focusedvalue-and-focusedbinding-property-wrappers-in-swiftui/

// For triggering whether an animation is active or not
struct FocusedAnimationActiveTriggerBinding : FocusedValueKey {
    typealias Value = Binding<Bool>
}

extension FocusedValues {
    
    var animationActiveTriggerBinding: FocusedAnimationActiveTriggerBinding.Value? {
        get { self[FocusedAnimationActiveTriggerBinding.self] }
        set { self[FocusedAnimationActiveTriggerBinding.self] = newValue }
    }
    
}
