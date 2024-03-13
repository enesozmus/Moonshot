//
//  Astronaut.swift
//  Moonshot
//
//  Created by enesozmus on 12.03.2024.
//

import SwiftUI

// As you can see, I’ve made that conform to Codable so we can create instances of this struct straight from JSON, but also Identifiable so we can use arrays of astronauts inside ForEach and more – that id field will do just fine.

// Next we want to convert astronauts.json into a dictionary of Astronaut instances, which means we need to use Bundle to find the path to the file, load that into an instance of Data, and pass it through a JSONDecoder
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
