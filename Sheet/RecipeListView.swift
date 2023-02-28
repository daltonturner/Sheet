//
//  ContentView.swift
//  Sheet
//
//  Created by Dalton Turner on 2/21/23.
//

import ComposableArchitecture
import SwiftUI

struct RecipeListView: View {

    let store: StoreOf<RecipeList>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            if viewStore.loadingState.isLoading {
                ProgressView()
            } else {
                recipeList(for: viewStore)
            }
        }
    }

    @ViewBuilder
    func recipeList(for viewStore: ViewStoreOf<RecipeList>) -> some View {
        ScrollView {
            ForEach(viewStore.loadingState.recipes) { recipe in
                VStack {
                    Button(
                        action: { viewStore.send(.recipeTapped(recipe: recipe)) }
                    ) {
                        HStack {
                            Text(recipe.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    Divider()
                }
                .foregroundColor(.primary)
            }
        }
        .padding()
    }
}
