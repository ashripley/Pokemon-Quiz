//
//  PokedexRow.swift
//  Pokemon Quiz
//
//  Created by Kat and Ash on 19/8/21.
//

import SwiftUI

struct PokedexRow: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        
        HStack {
            pokemon.image
                .resizable()
                .frame(width: 50, height: 50)
//                .clipShape(Rectangle())
//                .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
//                .shadow(radius: 3)
            
            Text("\(pokemon.number) \(pokemon.name)")
            
            Spacer()
        }
        .padding()
    }
}

struct PokedexRow_Previews: PreviewProvider {
    static var previews: some View {
        PokedexRow(pokemon: pokemon[0])
            .previewLayout(.fixed(width: 300, height: 70))

    }
}
