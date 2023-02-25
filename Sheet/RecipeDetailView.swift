//
//  RecipeDetailView.swift
//  Sheet
//
//  Created by Dalton Turner on 2/24/23.
//

import SwiftUI

struct RecipeDetailView: View {

    let recipeName: String

    var body: some View {
        VStack(alignment: .leading,spacing: .zero) {
            HStack {
                Text("Description:")
                    .bold()
                Text("A really good description.")
            }
            .padding()
            HStack {
                Text("Prep Time:")
                    .bold()
                Text("A really short amount of time")
            }
            .padding()
            List {
                Section {
                    Text("pasta")
                    Text("pasta")
                    Text("pasta")
                    Text("pasta")
                } header: {
                    Text("Ingredients")
                }
                .headerProminence(.increased)
            }
        }
        .navigationTitle(recipeName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
