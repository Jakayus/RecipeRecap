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
    
    // MustHaves
    let idMeal: String
    let strMeal: String?
    let strCategory: String?
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    // NiceMeasure  
    let strDrinkAlternate: String?
    let strArea: String?
    let strMealThumb: String?
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


