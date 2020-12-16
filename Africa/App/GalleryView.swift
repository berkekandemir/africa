//
//  GalleryView.swift
//  Africa
//
//  Created by Berke Can Kandemir on 12.12.2020.
//

import SwiftUI

struct GalleryView: View {
//    MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
//    SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
//    DYNAMIC GRID LAYOUT
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
//    MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
    //              MARK: - IMAGE
                    
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    
    //              MARK: - SLIDER
                    
                    Slider(value: $gridColumn, in: 2...4, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColumn, perform: { value in
                            gridSwitch()
                        })
                    
    //              MARK: - GRID
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { item in
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .onTapGesture {
                                    hapticImpact.impactOccurred()
                                    selectedAnimal = item.image
                                }
                        } //: LOOP
                    } //: GRID
                    .animation(.easeIn)
                    .onAppear(perform: {
                        gridSwitch()
                    })
                } //: VSTACK
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
            } //: SCROLL
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
            .navigationBarTitle("Gallery", displayMode: .inline)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}