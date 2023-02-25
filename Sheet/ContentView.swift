//
//  ContentView.swift
//  Sheet
//
//  Created by Dalton Turner on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        RecipeDetailView(recipeName: "Gnocci")
                    } label: {
                        Text("Gnocci")
                    }
                    NavigationLink {
                        RecipeDetailView(recipeName: "Cacio e Pepe")
                    } label: {
                        Text("Cacio e Pepe")
                    }
                    NavigationLink {
                        RecipeDetailView(recipeName: "Spagetti")
                    } label: {
                        Text("Spagetti")
                    }
                } header: {
                    Text("Pasta")
                }
                Section {
                    NavigationLink {
                        RecipeDetailView(recipeName: "Cesar")
                    } label: {
                        Text("Cesar")
                    }
                    NavigationLink {
                        RecipeDetailView(recipeName: "Strawberry Spinach")
                    } label: {
                        Text("Strawberry Spinach")
                    }
                } header: {
                    Text("Salads")
                }
            }
            .navigationTitle(Text("Recipes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
