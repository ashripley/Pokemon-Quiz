//
//  G1Pokedex.swift
//  Pokemon Quiz
//
//  Created by Kat and Ash on 19/8/21.
//

import SwiftUI

struct Gen1Pokedex: View {
    var body: some View {
        List(pokemon) { pokemon in
            NavigationLink(destination: pokedexDetail(pokemon: pokemon)) {
                PokedexRow(pokemon: pokemon)
            }
        }
        .navigationBarTitle("Pokedex")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Gen1Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Gen1Pokedex()
    }
}
