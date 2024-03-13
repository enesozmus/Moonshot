//
//  MissionView.swift
//  Moonshot
//
//  Created by enesozmus on 13.03.2024.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView:View {
    let mission: Mission
    
    // We need to add a property to MissionView that stores an array of CrewMember objects – these are the fully resolved role-astronaut pairings.
    let crew: [CrewMember]
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    CustomDivider()
                    Text("Launch Date")
                        .sectionHeadingStyle()
                    Text(mission.completeLaunchDate)
                    CustomDivider()
                    Text("Mission Highlights")
                        .sectionHeadingStyle()
                    Text(mission.description)
                    CustomDivider()
                    Text("Crew")
                        .sectionHeadingStyle()
                }
                .padding(.horizontal)
                //
                CrewScrollView(crew: crew)
                //
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
