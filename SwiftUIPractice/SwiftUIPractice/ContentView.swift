//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Omkar Shisode on 26/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("I will finish the swiftUI in one day")
                .font(.title)
                .bold()
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
