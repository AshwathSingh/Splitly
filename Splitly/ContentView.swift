//
//  ContentView.swift
//  Splitly
//
//  Created by Ashwath Singh on 06/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    Tab("Add a split", systemImage: "pencil.line") {
                        Home()
                    }
                    Tab("Your Splits", systemImage: "list.bullet") {
                        Bills()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
