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
            List {
                ForEach(viewStore.recipes) { recipe in
                    Text(recipe.name)
                        .onTapGesture {
                            viewStore.send(.recipeTapped)
                        }
                }
            }
        }
    }
}
