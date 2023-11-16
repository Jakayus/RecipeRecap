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

    var body: some View {
        ScrollView {
            Text("\((dataMgr.detailedMealList.meals.first?.strMeal ?? "No Dish Name provided"))")
                .bold()
                .font(.title)
            // using Apple example of error handling for AsyncImage
            AsyncImage(url: URL(string: meal.strMealThumb ?? "no image")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 250, alignment: .trailing)
                        .cornerRadius(3.0)
                    
                } else if phase.error != nil {
                    Label("Could not load image", systemImage: "photo")
                        .foregroundColor(Color("Secondary1"))
                } else {
                    ProgressView("Loading...")
                        .frame(maxWidth: 250, alignment: .trailing)
                }
            } // end AsyncImage

            Group {
                Text("Instructions")
                    .bold()
                Text(dataMgr.instructions)
                    .font(.body)
                Text("Ingredients")
                    .bold()
                Text(dataMgr.ingredientsList)
                    .font(.body)
                Text("Measurements")
                    .bold()
                Text(dataMgr.measurementList)
                    .font(.body)
            }
            .padding([.horizontal])

        }
        .task {
            dataMgr.detailedMealList = (try? await dataMgr.grabFoodDetails(for: meal.idMeal)) ?? emptyMeals
        }
    }
}

#Preview {
    RecipeDetails(dataMgr: RecipeViewModel(), meal: Meal(idMeal: "100", strMeal: "Strawberries Romanoff", strMealThumb: "https://www.themealdb.com/images/media/meals/oe8rg51699014028.jpg"))
}
