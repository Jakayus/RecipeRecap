//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var dataMgr: NetworkingManager
    
    @State var mainURL = ""
    
    let sampleList = ["meal1", "meal2", "meal3"]
    
    var mealList2 = [Meal]()
    
    
    var debugJSON = ""
    
    
    
    
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
                    // TODO: Apply a ForEach here for the meal list after grabbing from network
                    
                    ForEach(dataMgr.allMeals.meals) { meal in
                        NavigationLink  {
                            Text("\(meal.strMeal ?? "unknown meal") Details View")
                        }
                    label: {
                        Text("\(meal.strMeal ?? "unknown" )Item View")
                    }
                    }
                    
                }
                
                
                
            }
            .padding()
            .onAppear{
                dataMgr.BruteForce()
                
            }
        } // end Navigation View
    }
    
    
    
    
    
    
}

#Preview {
    ContentView(dataMgr: NetworkingManager())
}


