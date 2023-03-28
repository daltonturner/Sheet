//
//  Sheet.swift
//  Sheet
//
//  Created by Dalton Turner on 3/5/23.
//

import ComposableArchitecture
import SwiftUI

struct Sheet: ReducerProtocol {
    public struct State: Equatable {
        var filterQuery: String
        var recipes: [Recipe]

        static let initial = State(filterQuery: "", recipes: [])
    }

    public enum Action {
        case recipeWasSelected(name: String)
        case recipesLoaded([Recipe])
        case filterQueryChanged(String)
    }

    var loadRecipes: () -> EffectTask<[Recipe]>

    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .recipeWasSelected:
            return .none
        case .recipesLoaded(let recipes):
            state.recipes = recipes
            return .none
        case .filterQueryChanged(let query):
            state.filterQuery = query
            return .none
        }
    }
}

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
}
