//
//  NetworkingManager.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation
import SwiftUI


class NetworkingManager: ObservableObject {
    
    @Published var mainURL = ""
    @Published var allMeals = MealList(meals: [Meal]())
    
    var IDList = [String]() // only need ID properties
    

    
    
    
    func BruteForce() {
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
                        print("\(meal.idMeal)")
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
    
    
    
    
    
    
    // works
    func getMealListByCategory() {
        
        mainURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: mainURL) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.justGetTheIDs(data: data)
                
            } else {
                print("Error fetching data")
            }
        }
        task.resume()
        
    }
    
    // works
    func justGetTheIDs(data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let mealList = try decoder.decode(MealList.self, from: data)
            
            for meal in mealList.meals {
                IDList.append(meal.idMeal)
                //print(meal.idMeal)
            }
        } catch {
            print("Error decoding data")
        }
    }
    
    
    
    
    func getMealList() {
        
        for mealID in IDList {
            getMealByID(for: mealID)
        }
        
    }
    
    
    func getMealByID(for ID: String) {
        
        mainURL = "www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)"
        
        guard let url = URL(string: mainURL) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.decodeData(data: data)
                
            } else {
                print("Error fetching data")
            }
        }
        task.resume()
    }


    func decodeData(data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let mealList = try decoder.decode(MealList.self, from: data)
            
            for meal in mealList.meals {
              print("1")
               // DispatchQueue.main.async {
                    self.allMeals.meals.append(meal)
               // }
            }
            print("OTHER COUNT: \(mealList.meals.count)")
            print("COUNT: \(self.allMeals.meals.count)")
        } catch {
            print("Error decoding data")
        }
    }
    
    
    
}





//
//
//
//func decodeMealByIDData(data: Data) {
//    let decoder = JSONDecoder()
//    
//    do {
//        let mealList = try decoder.decode(MealList.self, from: data)
//        
//        for meal in mealList.meals {
//            print("\(meal.idMeal ?? "unknown meal")")
//            //mealList2.append(meal)
//        }
//        
//    } catch {
//        print("Error decoding meal by ID")
//    }
//    
//    
//}

//
//func grabAllMealData() {
//    
//    
//    mainURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
//    
//    guard let url = URL(string: mainURL) else {
//        print("Invalid URL")
//        return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            
//            self.getAllTheData(data: data)
//            
//        } else {
//            print("Error fetching data")
//        }
//    }
//    task.resume()
//}
//
//
//func getAllTheData(data: Data) {
//    let decoder = JSONDecoder()
//    
//    do {
//        
//        
//        let mealList = try decoder.decode(MealList.self, from: data)
//        
//        for meal in mealList.meals {
//            
//            DispatchQueue.main.async {
//                self.allMeals.meals.append(meal)
//            }
//            
//        }
//        
//        print("COUNT: \(allMeals.meals.count)")
//    } catch {
//        print("error decoding")
//    }
//}
//
//
//
//func getMealDetails(for ID: String) {
//    mainURL = "www.themealdb.com/api/json/v1/1/lookup.php?i=\(ID)"
//    
//    guard let url = URL(string: mainURL) else {
//        print("Invalid URL")
//        return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            self.decodeMealByIDData(data: data)
//        } else {
//            print("Error fetching data")
//        }
//    }
//    task.resume()
//    
//}
//
//}
