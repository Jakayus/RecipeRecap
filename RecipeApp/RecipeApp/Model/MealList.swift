//
//  Meals.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import Foundation

struct MealList: Decodable {
    
    var meals: [Meal]
    
    init(meals: [Meal]) {
        self.meals = meals
    }
}

