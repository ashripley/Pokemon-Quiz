//
//  ColourImage.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct setColourImage: View {
    // Properties
    var imageName: String

    var body: some View {
        // View Code
        Image(imageName)
            .resizable()
    }

    // Methods
}

struct ColourImage: View {
    var pokemon: Pokemon
    @State private var pokedexImage = ["Red", "Green", "Blue", "Yellow", "Purple"]
    
    var body: some View {
        
        if pokemon.type.contains("Fire") {
            setColourImage(imageName: self.pokedexImage[0])
        } else if pokemon.type.contains("Grass") {
            setColourImage(imageName: self.pokedexImage[1])
        } else if pokemon.type.contains("Water") {
            setColourImage(imageName: self.pokedexImage[2])
        } else if pokemon.type.contains("Flying") {
            setColourImage(imageName: self.pokedexImage[3])
        } else {
            setColourImage(imageName: self.pokedexImage[4])
        }
    }
}

struct ColourImage_Previews: PreviewProvider {
    static var previews: some View {
        ColourImage(pokemon: pokemon[0])
    }
}
