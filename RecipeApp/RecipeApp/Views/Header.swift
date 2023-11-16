//
//  Header.swift
//  RecipeApp
//
//  Created by Joel Sereno on 11/15/23.
//

import SwiftUI

struct Header: View {
    
    var body: some View {
        
        Text("Recipe Recap")
            .font(.custom("Zapfino", size: 25.0))
            .italic()
            .bold()
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    Header()
}
