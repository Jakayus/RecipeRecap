//
//  SingleMealRow.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

/// - Description: This represents a single row in the Meal List on the home page.
struct SingleMealRow: View {
    
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
                        .cornerRadius(3.0)
                    
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

#Preview {
    SingleMealRow(meal: Meal(idMeal: "100", strMeal: "Strawberries Romanoff", strMealThumb: "https://www.themealdb.com/images/media/meals/oe8rg51699014028.jpg"))
}
