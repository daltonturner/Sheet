import ComposableArchitecture
import SwiftUI

struct RecipeList: ReducerProtocol {
    struct State: Equatable {
        var filterText: String
        var loadingState: LoadingState
        var recipes: [Recipe] = []
        var recipeAlert: String?
        var selectedRecipe: Recipe?

        enum LoadingState: Equatable {
            case loaded(recipes: [Recipe])
            case loading

            var recipes: [Recipe] {
                guard case .loaded(let recipes) = self else { return [] }
                return recipes
            }

            var isLoading: Bool { self == .loading }
        }
    }

    enum Action: Equatable {
        case filterTextChanged(String)
        case loadRecipes
        case recipeAlertDismissed
        case recipesLoaded(Result<[Recipe], networkError>)
        case selectRecipe(Recipe)
    }

    @Dependency(\.recipeClient) var recipeClient

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case let .filterTextChanged(text):
            state.filterText = text
            return .none

        case .loadRecipes:
            return .none

        case .recipeAlertDismissed:
            state.recipeAlert = nil
            return .none

        case let .recipesLoaded(.success(recipes)):
            state.recipes = recipes
            return .none

        case .recipesLoaded(.failure):
            state.recipeAlert = "Could not load recipes :("
            return .none

        case let .selectRecipe(recipe):
            state.selectedRecipe = recipe
            return .none
        }
    }
}

enum networkError: Error, Equatable {
    case networkError
    case decodingError
    case unknownError(String)
}
