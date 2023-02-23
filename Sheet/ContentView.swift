//
//  ContentView.swift
//  Sheet
//
//  Created by Dalton Turner on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "cooktop")
                .imageScale(.large)
                .foregroundColor(.blue)
            Text("Sheet")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
