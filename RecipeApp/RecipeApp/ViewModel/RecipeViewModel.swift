//
//  NetworkingManager.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation
import SwiftUI

@MainActor /// class needs to act on the main thread

/// This class acts as the ViewModel for the Recipe App.
class RecipeViewModel: ObservableObject {
    
    /// MealList type arrays used to capture the decoded JSON data
    @Published var allMeals = MealList(meals: [Meal]())
    @Published var detailedMealList = MealList(meals: [Meal]())

    /// Captured lists for quick display in the RecipeDetails View
    @Published var ingredientsList = ""
    @Published var measurementList = ""
    @Published var instructions: String = ""
        
    var stringList: [String] = []
    
    /// This function grabs a list of Meals from the Meal DB API based upon the "Dessert" category
    /// - Parameter Void
    /// - Returns MealList: The array representing all the meals in the Dessert category
    func grabList() async throws -> MealList {
        let mealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: mealURL)
        return try JSONDecoder().decode(MealList.self, from: data)
    }
    
    /// This function grabs a meal based upon its ID. The API displays a list of one meal in an array.
    ///   - Parameter ID: The String ID associated with an individual Meal
    ///   - Returns MealList: The array of size 1 representing a single meal based upon Meal ID
    func grabFoodDetails(for ID: String) async throws -> MealList {
        
        /// Decode JSON data representing a single meal in an array
        let singleMealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)")!
        let (data, _) = try await URLSession.shared.data(from: singleMealURL)
        
        let MealList = try JSONDecoder().decode(MealList.self, from: data)
        
        
        /// Use the decoded data and set the instruciton string accordingly for display
        if let decodedInstructions = MealList.meals.first?.strInstructions {
            instructions = decodedInstructions
        } else {
            instructions = "No Instructions Provided"
        }
        

        /// Use the decoded data and filter out nil or empty ingredients for display
        var ingredientsArray = [String]()
        var ingredientsWithNil: [String?] = []
        ingredientsWithNil.append(MealList.meals.first?.strIngredient1)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient2)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient3)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient4)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient5)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient6)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient7)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient8)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient9)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient10)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient11)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient12)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient13)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient14)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient15)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient16)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient17)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient18)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient19)
        ingredientsWithNil.append(MealList.meals.first?.strIngredient20)
        
        ingredientsArray = ingredientsWithNil.compactMap { $0 }
        ingredientsArray = ingredientsArray.filter { !$0.isEmpty }
        ingredientsList = ingredientsArray.joined(separator: ",")

        /// Use the decoded data and filter out nil or empty measurements for display
        var measurementsArray = [String]()
        var measurementsWithNil: [String?] = []
        
        measurementsWithNil.append(MealList.meals.first?.strMeasure1)
        measurementsWithNil.append(MealList.meals.first?.strMeasure2)
        measurementsWithNil.append(MealList.meals.first?.strMeasure3)
        measurementsWithNil.append(MealList.meals.first?.strMeasure4)
        measurementsWithNil.append(MealList.meals.first?.strMeasure5)
        measurementsWithNil.append(MealList.meals.first?.strMeasure6)
        measurementsWithNil.append(MealList.meals.first?.strMeasure7)
        measurementsWithNil.append(MealList.meals.first?.strMeasure8)
        measurementsWithNil.append(MealList.meals.first?.strMeasure9)
        measurementsWithNil.append(MealList.meals.first?.strMeasure10)
        measurementsWithNil.append(MealList.meals.first?.strMeasure11)
        measurementsWithNil.append(MealList.meals.first?.strMeasure12)
        measurementsWithNil.append(MealList.meals.first?.strMeasure13)
        measurementsWithNil.append(MealList.meals.first?.strMeasure14)
        measurementsWithNil.append(MealList.meals.first?.strMeasure15)
        measurementsWithNil.append(MealList.meals.first?.strMeasure16)
        measurementsWithNil.append(MealList.meals.first?.strMeasure17)
        measurementsWithNil.append(MealList.meals.first?.strMeasure18)
        measurementsWithNil.append(MealList.meals.first?.strMeasure19)
        measurementsWithNil.append(MealList.meals.first?.strMeasure20)
        
        measurementsArray = measurementsWithNil.compactMap { $0 }
        measurementsArray = measurementsArray.filter { !$0.isEmpty }
        measurementList = measurementsArray.joined(separator: ",")
        
       
        return MealList
       
    }
    
}
