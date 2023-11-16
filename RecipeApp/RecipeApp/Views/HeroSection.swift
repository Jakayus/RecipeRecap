//
//  HeroSection.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

/// - Description: This represents the Hero section of the app, enticing the user to proceed with app usage
struct HeroSection: View {

    @Environment(\.colorScheme) var colorScheme
    let heroText = "Choose a dessert below to see instructions on how to make it. Learn to create a new dessert today!"

    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .secondary1 : .secondary2) // light vs dark mode
                .frame(maxWidth: .infinity, maxHeight: 250)
            HStack{
                Text(heroText)
                    .foregroundColor(colorScheme == .light ? .secondary2 : .secondary1) // light vs dark mode
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
