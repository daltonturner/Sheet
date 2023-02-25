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
        let recipes: [Recipe]

        public init() {
            self.recipes = [
                Recipe(name: "Ragu"),
                Recipe(name: "Cacio e Pepe"),
                Recipe(name: "Bolognese"),
            ]
        }
    }

    enum Action: Equatable {
        case recipeTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .recipeTapped:
            return .none
        }
    }
}

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
}
