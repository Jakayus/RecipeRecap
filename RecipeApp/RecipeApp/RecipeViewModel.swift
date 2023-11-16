//
//  NetworkingManager.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation
import SwiftUI


class RecipeViewModel: ObservableObject {
    
    @Published var mainURL = ""
    @Published var allMeals = MealList(meals: [Meal]())

    
    func getMealListByCategory() {
        let URL1 = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        // decode and grab list
        let decoder = JSONDecoder()
        
        guard let url = URL(string: URL1) else {
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
    
    
    
    func BruteForce2() {
        // decode and grab list
        let decoder = JSONDecoder()

        for index in 0..<allMeals.meals.count {
            
            print("counting:\(allMeals.meals[index].idMeal)")
            
            let URL2 = "www.themealdb.com/api/json/v1/1/lookup.php?i=\(allMeals.meals[index].idMeal)"
            guard let url = URL(string: URL2) else {
                print("Invalid URL")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    
                    do {
                        let mealList = try decoder.decode(MealList.self, from: data)
                        
                        // set current array meal data to network meal data
                        self.allMeals.meals[index] = mealList.meals[0] //only one meal each time the page loads
                        
                    } catch {
                        print("Error decoding data")
                    }
                    
                } else {
                    print("Error fetching data")
                }
            }
            task.resume()
        }
        
        print("count: \(allMeals.meals.count)")
    }
    
 
    
    
}
