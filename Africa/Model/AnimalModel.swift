//
//  AnimalModel.swift
//  Africa
//
//  Created by Berke Can Kandemir on 13.12.2020.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
