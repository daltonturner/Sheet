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
                initialState: RecipeList.State(),
                reducer: RecipeList()
              )
            )
        }
    }
}
