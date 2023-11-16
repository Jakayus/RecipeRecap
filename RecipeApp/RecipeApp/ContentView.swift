//
//  ContentView.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/14/23.
//

import SwiftUI


struct Header: View {
    var body: some View {
        
        Text("Recipe Recap")
            .italic()
            .bold()
            .font(.largeTitle)
            .padding()
    }
}


struct HeroSection: View {
    var body: some View {
        ZStack {
            Color(.primary1)
                .frame(maxWidth: .infinity, maxHeight: 250)
            HStack{
                Text("Choose a dessert below to see ingredients, recipe instructions, and more!")
                    .font(.title2)
                    .padding([.horizontal], 5)
                Image(.recipebook)
                    .resizable()
                    .frame(width: 180, height: 100)
                    .cornerRadius(5)
            }
        }
    }
}


struct MealItemView: View {
    
    let meal: Meal
    
    var body: some View {
        HStack{
            Text("\(meal.strMeal ?? "unknown" )")
                .foregroundColor(.primary)
            
            Spacer()
            
            // using Apple example of error handling for AsyncImage
            AsyncImage(url: URL(string: meal.strMealThumb ?? "no image")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150, alignment: .trailing)
                    
                } else if phase.error != nil {
                    Label("Could not load image", systemImage: "photo")
                        .foregroundColor(Color("Secondary1"))
                } else {
                    ProgressView("Loading...")
                        .frame(maxWidth: 150, alignment: .trailing)
                }
            } // end AsyncImage
        }
    }
}



struct MealListView: View {
    
    @ObservedObject var dataMgr: DataManager
    
    var body: some View {
        List {
            ForEach(dataMgr.allMeals.meals) { meal in
                NavigationLink  {
                    Text("\(meal.strMeal ?? "unknown meal") Details View")
                }
            label: {
                MealItemView(meal: meal)
            }
                
            }
            
        }
    }
}



struct ContentView: View {
    
    @ObservedObject var dataMgr: DataManager
    
    var body: some View {
        
        
        NavigationView{
            VStack(spacing: 0) {
                Header()
                HeroSection()
                MealListView(dataMgr: dataMgr)
                
            }
        }
        .onAppear{
            dataMgr.BruteForce()
        }
       
        
//        NavigationView {
//            
//            VStack {
//                
//                // Header
//                Header()
//                
//                // Hero Section
//                HeroSection()
//                
//                // Meal Items
//                //MealListView(dataMgr: dataMgr)
//                
//                
//                
//            }
//            .padding()
//            .onAppear{
//                dataMgr.BruteForce()
//            }
//        } // end Navigation View
//        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    
    
    
}

#Preview {
    ContentView(dataMgr: DataManager())
}


// note - color hunt link: https://colorhunt.co/palette/a7d397f5eec8d0d4ca555843

