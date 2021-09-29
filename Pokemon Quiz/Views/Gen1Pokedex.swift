//
//  G1Pokedex.swift
//  Pokemon Quiz
//
//  Created by Ash on 19/8/21.
//

import SwiftUI

struct Gen1Pokedex: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(pokemon) { pokemon in
                    NavigationLink(destination: pokedexDetail(pokemon: pokemon)) {
                        PokedexRow(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
        
//        List(pokemon) { pokemon in
//            NavigationLink(destination: pokedexDetail(pokemon: pokemon)) {
//                PokedexRow(pokemon: pokemon)
//            }
//        }
//        .navigationBarTitle("Pokedex")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}

struct Gen1Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Gen1Pokedex()
    }
}


