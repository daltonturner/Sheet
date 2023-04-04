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
            }
        }
    }

    @ViewBuilder
    func recipeList(for viewStore: ViewStoreOf<RecipeList>) -> some View {
        ScrollView {
            ForEach(viewStore.loadingState.recipes) { recipe in
                VStack {
                    HStack {
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            Text(recipe.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    Divider()
                }
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
        RecipeListView(store:
                .init(
                    initialState:.init(
                        filterText: "",
                        loadingState: .loaded(
                            recipes: [
                                Recipe(
                                    name: "Gnocci",
                                    description: "Potato Pasta",
                                    ingredients: [
                                        Ingredient(
                                            name: "Pasta",
                                            quantity: "16 oz"
                                        )
                                    ],
                                    steps: ["Boil Water", "Eat"]
                                )
                            ]
                        )
                    ),
                    reducer: RecipeList()
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
