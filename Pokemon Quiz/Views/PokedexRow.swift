//
//  PokedexRow.swift
//  Pokemon Quiz
//
//  Created by Ash on 19/8/21.
//

import SwiftUI

struct PokedexRow: View {
    let pokemon: Pokemon

    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.number)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)

                    pokemon.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(pokemon.backgroundColor(forType: pokemon.type))
        .cornerRadius(12)
        .shadow(color: pokemon.backgroundColor(forType: pokemon.type), radius: 2, x: 0.0, y: 0.0)
    }
}
        
        
//        HStack {
//            pokemon.image
//                .resizable()
//                .frame(width: 50, height: 50)
////                .clipShape(Rectangle())
////                .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
////                .shadow(radius: 3)
//
//            Text("\(pokemon.number) \(pokemon.name)")
//
//            Spacer()
//        }
//        .padding()


struct PokedexRow_Previews: PreviewProvider {
    static var previews: some View {
        PokedexRow(pokemon: pokemon[0])
//            .previewLayout(.fixed(width: 300, height: 70))

    }
}
