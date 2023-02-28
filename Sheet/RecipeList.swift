//
//  Recipe.swift
//  Sheet
//
//  Created by Dalton Turner on 2/25/23.
//

import ComposableArchitecture
import SwiftUI

struct RecipeList: ReducerProtocol {
    struct State: Equatable {
        let loadingState: LoadingState

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
        case onAppear
        case recipeTapped(recipe: Recipe)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            return .none
        case .recipeTapped:
            return .none
        }
    }
}

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
}
