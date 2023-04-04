import SwiftUI
import ComposableArchitecture

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            Text(recipe.name).font(.largeTitle)
            Text(recipe.description).padding()
            // Add other recipe details
        }
    }
}
