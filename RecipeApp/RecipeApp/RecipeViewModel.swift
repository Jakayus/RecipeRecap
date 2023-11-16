//
//  NetworkingManager.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation
import SwiftUI


class RecipeViewModel: ObservableObject {
    
    @Published var allMeals = MealList(meals: [Meal]())
    @Published var detailedMealList = MealList(meals: [Meal]())

    
    enum ExampleError: Error {
        case ErrorType1
    }
    
    
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
        return try JSONDecoder().decode(MealList.self, from: data)
    }

// call second dependent on the first
    
    
    func getMealListByCategory() {
        
        // reset list
        detailedMealList = MealList(meals: [Meal]())
        
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        // decode and grab list
        let decoder = JSONDecoder()
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                
                do {
                    let mealList = try decoder.decode(MealList.self, from: data)
                    
                    for meal in mealList.meals {
                        DispatchQueue.main.async {
                            self.allMeals.meals.append(meal)
                        }
                        
                    }
                } catch {
                    print("Error decoding data")
                }
                
            } else {
                print("Error fetching data")
            }
        }
        task.resume()
        
        
        // decode and get additional data
    }
    
    
    
    func getMealDetails(for ID: String) {
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)"
        
        // decode and grab list
        let decoder = JSONDecoder()
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                
                do {
                    let mealList = try decoder.decode(MealList.self, from: data)
                    
                    for meal in mealList.meals {
                        DispatchQueue.main.async {
                            self.detailedMealList.meals.append(meal)
                            print("number: \(self.detailedMealList.meals.count)")
                        }
                        
                    }
 
                } catch {
                    print("Error decoding data")
                }
                
            } else {
                print("Error fetching data")
            }
        }
        task.resume()
        
    }
    
 
    
    
}
