//
//  RecipeList.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

/// - Description: This view provides the list of Desserts for the user to pick out and explore
struct RecipeList: View {
    
    @ObservedObject var dataMgr: RecipeViewModel
    
    var body: some View {
        List {
            ForEach(dataMgr.allMeals.meals) { meal in
                NavigationLink  {
                    RecipeDetails(dataMgr: dataMgr, meal: meal)
                } label: {
                    SingleMealRow(meal: meal)
                }
            }
        }
    }
}

#Preview {
    RecipeList(dataMgr: RecipeViewModel())
}

