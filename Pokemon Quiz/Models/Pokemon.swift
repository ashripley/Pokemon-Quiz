//
//  Pokemon.swift
//  Pokemon Quiz
//
//  Created by  Ash on 19/8/21.
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
    
    func typeImage(forType type: String) -> Image {
        if type.contains("Grass") {
            return Image("Grass")
        }else {
            return Image("Fire")
        }
    }
    
    func backgroundColor(forType type: String) -> Color {
        if type.contains("Fire") {
            return .red
        }else if type.contains("Water") {
            return .blue
        }else if type.contains("Electric") {
            return .yellow
        }else if type.contains("Psychic") {
            return .purple
        }else if type.contains("Grass") {
            return .green
        }else if type.contains("Poison") {
            return .green
        }else if type.contains("Bug") {
            return .green
        }else if type.contains("Normal") {
            return .gray
        }else if type.contains("Flying") {
            return .orange
        }else if type.contains("Fairy") {
            return .pink
        }else if type.contains("Dragon") {
            return .purple
        }else if type.contains("Ice") {
            return .blue
        }else if type.contains("Rock") {
            return .gray
        }else if type.contains("Ground") {
            return .gray
        }else {
            return .yellow
        }
    }
}
        
//        switch type {
//        case self.type.contains(String): return .red
//        case "Grass, ", "Grass", "Bug", "Bug, *", "Poison", "Poison, *": return .green
//        case "Water", "Water, *": return .blue
//        case "Electric", "Electric, *": return .yellow
//        case "Psychic", "Psychic, *", "Ghost", "Ghost, *": return .purple
//        case "Normal", "Normal, *": return .gray
//        case "Ground", "Ground, *": return .gray
//        case "Flying", "Flying, *": return .blue
//        case "Fairy", "Fairy, *": return .pink
//        default: return .yellow
//        }
