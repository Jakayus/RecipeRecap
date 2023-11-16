//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI

/// - Description: Starting Screen for the App
struct ContentView: View {
    
    @ObservedObject var dataMgr: RecipeViewModel
    var emptyMeals = MealList(meals: [Meal]())
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 0) {
                Header()
                HeroSection()
                RecipeList(dataMgr: dataMgr)
            }
        }
        .task {
            dataMgr.allMeals = (try? await dataMgr.grabList()) ?? emptyMeals // declare meals as empty if needed
        }
    }
}

#Preview {
    ContentView(dataMgr: RecipeViewModel())
}



