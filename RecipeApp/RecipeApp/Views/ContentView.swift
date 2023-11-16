//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI

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
            dataMgr.allMeals = (try? await dataMgr.grabList()) ?? emptyMeals
        }
    }
}

#Preview {
    ContentView(dataMgr: RecipeViewModel())
}


// note - color hunt link: https://colorhunt.co/palette/a7d397f5eec8d0d4ca555843

