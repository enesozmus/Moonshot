//
//  ContentView.swift
//  Moonshot
//
//  Created by enesozmus on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    // -> Loading a specific kind of Codable data
    // let _astronauts = Bundle.main.decode("astronauts.json")
    let _astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let _missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var isShowingGrid = true
    
    var body: some View {
        
        NavigationView {
            Group {
                if isShowingGrid {
                    GridLayout(astronauts: _astronauts, missions: _missions)
                } else {
                    ListLayout(astronauts: _astronauts, missions: _missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingGrid.toggle()
                    } label: {
                        Text("Show as \(isShowingGrid ? "List" : "Grid")")
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
