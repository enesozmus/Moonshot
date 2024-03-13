//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by enesozmus on 12.03.2024.
//

import SwiftUI

// -> We added a Bundle extension for loading one specific type of JSON data from our app bundle
// -> ...anything we can do to help our views stay small and focused is a good thing.
extension Bundle {
    //func decode(_ file: String) -> [String: Astronaut] {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            // if the file can’t be found, loaded, or decoded the app will crash.
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            // if the file can’t be found, loaded, or decoded the app will crash.
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        // -> Swift’s JSONDecoder type has a property called dateDecodingStrategy, which determines how it should decode dates.
        // -> We can provide that with a DateFormatter instance that describes how our dates are formatted.
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        //guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            // if the file can’t be found, loaded, or decoded the app will crash.
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}

/*
     -> We can leverage Swift’s generics system.
     -> Generics allow us to write code that is capable of working with a variety of different types.
     -> In this project, we wrote the Bundle extension to work with dictionary of astronauts, but really we want to be able to handle dictionaries of astronauts, arrays of missions, or potentially lots of other things.
     ->  To make a method generic, we give it a placeholder for certain types. This is written in angle brackets (< and >) after the method name but before its parameters, like this:
     
     func decode<T>(_ file: String) -> T {
     
     -> “T” is a bit of a convention in coding, as a short-hand placeholder for “type”.
 */
