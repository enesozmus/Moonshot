//
//  Mission.swift
//  Moonshot
//
//  Created by enesozmus on 12.03.2024.
//

import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // -> We’re going to add some computed properties to the Mission struct to send that same data back.
    // -> This means any other views can use the same data without having to repeat our string interpolation code.
    var displayName: String {
        "Apollo \(id)"
    }
    
    // -> This is another place where a computed property works better.
    var image: String {
        "apollo\(id)"
    }
    
    // -> This is another place where a computed property works better.
    var abbreviatedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    // -> This is another place where a computed property works better.
    var completeLaunchDate: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
