//
//  HeroSection.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

struct HeroSection: View {

    @Environment(\.colorScheme) var colorScheme
    let heroText = "Choose a dessert below to see ingredients, recipe instructions, and more!"

    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .secondary1 : .secondary2)
                .frame(maxWidth: .infinity, maxHeight: 250)
            HStack{
                Text(heroText)
                    .foregroundColor(colorScheme == .light ? .secondary2 : .secondary1)
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

#Preview {
    HeroSection()
}
