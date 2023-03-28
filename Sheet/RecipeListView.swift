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
            NavigationView {
                VStack {
                    searchBar(for: viewStore)
                    if viewStore.loadingState.isLoading {
                        Spacer()
                        ProgressView()
                        Spacer()
                    } else {
                        recipeList(for: viewStore)
                    }
                }
                .padding()
                .navigationTitle("Recipes")
                .onAppear { viewStore.send(.onAppear) }
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

    @ViewBuilder
    func searchBar(for viewStore: ViewStoreOf<RecipeList>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(
                "Filter recipes",
                /*
                 TCA provides a helper function `binding` on the ViewStore. It reads data from State
                 and uses an action to send data to the Store via Reducer with the given action.
                 */
                text: viewStore.binding(
                    get: \.filterText,
                    send: RecipeList.Action.filterTextChanged
                )
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .disableAutocorrection(true)
        }
    }
}

struct RecipieListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(
            store: Store(
                initialState: RecipeList.State(
                    filterText: "",
                    loadingState: .loaded(
                        recipes: [
                            Recipe(name: "Gnocci"),
                            Recipe(name: "Gnocci"),
                            Recipe(name: "Gnocci"),
                        ]
                    )
                ),
                reducer: .empty,
                environment: ()
            )
        )
        RecipeListView(
            store: Store(
                initialState: RecipeList.State(
                    filterText: "",
                    loadingState: .loading
                ),
                reducer: .empty,
                environment: ()
            )
        )
    }
}
