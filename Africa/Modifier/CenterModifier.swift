//
//  CenterModifier.swift
//  Africa
//
//  Created by Berke Can Kandemir on 14.12.2020.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
