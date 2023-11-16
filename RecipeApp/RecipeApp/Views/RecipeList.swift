//
//  RecipeList.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI




struct RecipeList: View {
    
    @ObservedObject var dataMgr: RecipeViewModel
    
    var body: some View {
        List {
            ForEach(dataMgr.allMeals.meals) { meal in
                NavigationLink  {
                    RecipeDetails(dataMgr: dataMgr, meal: meal)
                    //RecipeDetails(dataMgr: dataMgr, meal: meal)
                } label: {
                    SingleMealRow(meal: meal)
                }
            }
        }
    }
}

#Preview {
    RecipeList(dataMgr: RecipeViewModel())
}


let PreviewJSON = """
{
  "meals": [
    {
      "strMeal": "Apam balik",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
      "idMeal": "53049"
    },
    {
      "strMeal": "Apple & Blackberry Crumble",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
      "idMeal": "52893"
    },
    {
      "strMeal": "Apple Frangipan Tart",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
      "idMeal": "52768"
    },
    {
      "strMeal": "Bakewell tart",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
      "idMeal": "52767"
    },
    {
      "strMeal": "Banana Pancakes",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
      "idMeal": "52855"
    },
    {
      "strMeal": "Battenberg Cake",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/ywwrsp1511720277.jpg",
      "idMeal": "52894"
    },
    {
      "strMeal": "BeaverTails",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
      "idMeal": "52928"
    },
    {
      "strMeal": "White chocolate creme brulee",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/uryqru1511798039.jpg",
      "idMeal": "52917"
    }
  ]
}
"""
