//
//  NetworkingManager.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation
import SwiftUI

@MainActor // class needs to act on the main thread
class RecipeViewModel: ObservableObject {
    
    @Published var allMeals = MealList(meals: [Meal]())
    @Published var detailedMealList = MealList(meals: [Meal]())

    @Published var ingredientsList = ""
    @Published var measurementList = ""
    @Published var instructions: String = ""
    
    
    
    
    enum ExampleError: Error {
        case ErrorType1
    }
    
    var stringList: [String] = []
    
 // call first function
// async call for meal list
    func grabList() async throws -> MealList {
        let mealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: mealURL)
        return try JSONDecoder().decode(MealList.self, from: data)
    }
    
    
    func grabFoodDetails(for ID: String) async throws -> MealList {
        
        // decode Meal List
        let singleMealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)")!
        let (data, _) = try await URLSession.shared.data(from: singleMealURL)
        
        let MealList = try JSONDecoder().decode(MealList.self, from: data)
        
        
        // capture instructins
        if let decodedInstructions = MealList.meals.first?.strInstructions {
            instructions = decodedInstructions
        } else {
            instructions = "No Instructions Provided"
        }
        

        // capture ingredients
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
        
        // filter out nil or empty ingredients
        ingredientsArray = ingredientsWithNil.compactMap { $0 }
        ingredientsArray = ingredientsArray.filter { !$0.isEmpty }
        ingredientsList = ingredientsArray.joined(separator: ",")

        // capture measurements
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
        
        // filter out nil or empty ingredients
        measurementsArray = measurementsWithNil.compactMap { $0 }
        measurementsArray = measurementsArray.filter { !$0.isEmpty }
        measurementList = measurementsArray.joined(separator: ",")
        
        
        
        return MealList
        
       
    }
    
}

//        // Take advantage of Mirror-ing and use it to iterate through struct properties.
//        // compare type against strings and remove nils
//        // compare values against empty strings
//        // new array should be returned
////
//        let mirror = Mirror(reflecting: MealList.meals)
//
//        var stringValues: [String?] = []
//
//        var stringArray: [String] = []
//        var singleString = ""
//
//        for child in mirror.children {
//            //print("value: \(child.value)\n\n")
//            //print("label: \(child.label)\n\n")
//            //singleString = child.value ?? "nil"
//
//            if let stringValue = child.value as? String? {
//                stringValues.append(stringValue)
//            }
//
//
//        }
//        print("stringValues: \(stringValues)")
//
//
//        //let stringList2: [String] = stringList.compactMap { $0 } // remove nils
//
//
//       // stringList = singleString.components(separatedBy: ",")
//
//       // print("stringList: \(stringList)\n\n")
