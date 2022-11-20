//
//  Functions.swift
//  KeyboardShortcuts
//
//  Created by Russell Gordon on 2022-11-20.
//

import Foundation

// Return the directory that we can save user data in
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
