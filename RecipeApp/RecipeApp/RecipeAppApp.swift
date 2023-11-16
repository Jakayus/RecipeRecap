//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    
    @StateObject var dataMgr = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(dataMgr: dataMgr)
        }
    }
}
