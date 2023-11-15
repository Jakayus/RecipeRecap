//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var mainURL = ""
    
    let sampleList = ["meal1", "meal2", "meal3"]
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Header
                HStack{
                    Text("Header goes here")
                }
                
                // Hero Section
                VStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hero Section!")
                }
                
                // Meal Items
                List {
                    // TODO: Apply a ForEach here for the meal list
                    
                    ForEach(sampleList, id: \.self) { meal in
                        NavigationLink  {
                            Text("\(meal) Details View")
                        } label: {
                            Text("\(meal) Item View")
                        }
                    }
                    
                }
                
                
                
            }
            .padding()
            .onAppear{
               // getMealData() DEBUG purposes only
            }
        } // end Navigation View
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


