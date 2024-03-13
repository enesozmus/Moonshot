//
//  CustomViewModifier.swift
//  Moonshot
//
//  Created by enesozmus on 13.03.2024.
//

import SwiftUI

struct SectionHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
            .padding(.bottom, 5)
    }
}

extension View {
    func sectionHeadingStyle() -> some View {
        modifier(SectionHeadingStyle())
    }
}
