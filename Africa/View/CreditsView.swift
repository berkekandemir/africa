//
//  CreditsView.swift
//  Africa
//
//  Created by Berke Can Kandemir on 14.12.2020.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Berke Can Kandemir
    All rights reserved
    Better App ♡ Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
