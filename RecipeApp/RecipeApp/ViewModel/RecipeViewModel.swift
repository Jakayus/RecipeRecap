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

    @Published var ingredientsArray = [String]()
    @Published var measurementsArray = [String]()
    @Published var Instructions: String? = nil
    
    @Published var stringTest = ""
    
    
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
        let singleMealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)")!
        let (data, _) = try await URLSession.shared.data(from: singleMealURL)
        
        let MealList = try JSONDecoder().decode(MealList.self, from: data)
        
        var ingredientsWithNil: [String?] = []
        var measurementsWithNil: [String?] = []
        
        
        
        
        // capture ingredients
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
        
        // filter out ingredients
        ingredientsArray = ingredientsWithNil.compactMap { $0 }
        stringTest = ingredientsArray.joined(separator: ",")
        
        
        
        // capture measurements
        
        
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
