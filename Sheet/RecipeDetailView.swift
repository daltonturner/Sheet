//
//  RecipeDetailView.swift
//  Sheet
//
//  Created by Dalton Turner on 2/24/23.
//

import SwiftUI
import ComposableArchitecture

struct RecipeDetailView: View {

    let store: StoreOf<RecipeDetail>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
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
            .navigationTitle(viewStore.recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
