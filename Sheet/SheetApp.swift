import ComposableArchitecture
import SwiftUI

@main
struct SheetApp: App {
    var body: some Scene {
        WindowGroup {
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
        }
    }
}
