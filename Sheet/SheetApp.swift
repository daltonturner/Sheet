//
//  SheetApp.swift
//  Sheet
//
//  Created by Dalton Turner on 2/21/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct SheetApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView(
                store: Store(
                    initialState: RecipeList.State(
                        filterText: "",
                        loadingState: .loaded(
                            recipes: [
                                Recipe(name: "Gnocci"),
                                Recipe(name: "Gnocci"),
                                Recipe(name: "Gnocci"),
                            ])
                    ),
                    reducer: RecipeList()
                )
            )
        }
    }
}
