//
//  Pokemon.swift
//  Pokemon Quiz
//
//  Created by Kat and Ash on 19/8/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var number: String
    var weaknesses: String
    var evolutions: String
    var abilities: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
