import ComposableArchitecture
import SwiftUI

struct RecipeDetail: ReducerProtocol {
    struct State: Equatable {
        var recipe: Recipe
    }

    enum Action: Equatable {
        case onAppear
        case dismiss
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .dismiss:
            return .none
        case .onAppear:
            return .none
        }
    }
}
