//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI

struct MealList: Decodable {
    
    let meals: [Meal]
}

struct Meal: Decodable {
    
    let idMeal: String
    let strMealThumb: String?
    let strMeal: String?

    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    
}



struct ContentView: View {
    
    @State var mainURL = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            getMealData()
        }
    }
    
    
    func decodeMealByIDData(data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let mealList = try decoder.decode(MealList.self, from: data)
            
            for meal in mealList.meals {
                print("\(meal.strMeal ?? "unknown meal")")
            }
            
        } catch {
            print("Error decoding meal by ID")
        }

        
    }
    
    func getMealData() {
        
        mainURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: mainURL) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.decodeMealByIDData(data: data)
            } else {
                print("Error fetching data")
            }
        }
        task.resume()
        
    }
    
 
    
}

#Preview {
    ContentView()
}


