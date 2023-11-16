//
//  RecipeList.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

struct RecipeList: View {
    
    @ObservedObject var dataMgr: RecipeViewModel
    
    var body: some View {
        List {
            ForEach(dataMgr.allMeals.meals) { meal in
                NavigationLink  {
                    RecipeDetails(dataMgr: dataMgr, meal: meal)
                    //RecipeDetails(dataMgr: dataMgr, meal: meal)
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

