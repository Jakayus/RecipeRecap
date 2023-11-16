//
//  RecipeDetails.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/16/23.
//

import SwiftUI

struct RecipeDetails: View {
    
    @ObservedObject var dataMgr: RecipeViewModel
    let meal: Meal
    var emptyMeals = MealList(meals: [Meal]())
    
    let sampleText:String? = nil
    
    
    
    // meal name
    // instructions
    // ingredients/measurements
    
    var body: some View {
        VStack {
            
//            ForEach(dataMgr.stringList, id: \.self)  {
//                Text("\($0)")
//            }
            Text("\(dataMgr.stringTest)")
                .multilineTextAlignment(.center)
            
            
        }
        .task {
            dataMgr.detailedMealList = (try? await dataMgr.grabFoodDetails(for: meal.idMeal)) ?? emptyMeals
        }
        
    }
}

#Preview {
    RecipeDetails(dataMgr: RecipeViewModel(), meal: Meal(idMeal: "100", strMeal: "Strawberries Romanoff", strMealThumb: "https://www.themealdb.com/images/media/meals/oe8rg51699014028.jpg"))
}
