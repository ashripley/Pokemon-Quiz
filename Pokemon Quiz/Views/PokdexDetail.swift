//
//  PokdexDetail.swift
//  Pokemon Quiz
//
//  Created by Kat and Ash on 19/8/21.
//

import SwiftUI

struct pokedexDetail: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            
            ColourImage(pokemon: pokemon)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            
            CircleImage(image: pokemon.image)
                .offset(y: -155)
                .padding(.bottom, -1500)

            VStack(alignment: .leading) {
                Text(pokemon.number)
                    .font(.subheadline)
                
                Text(pokemon.name)
                    .font(.title)
                    .padding(.bottom, 10)

                
                HStack {
                    Text("Type:")

                    Spacer()
                    
                    Text(pokemon.type)
                }
                .font(.subheadline)
                .foregroundColor(.black)
                
                HStack {
                    Text("Weaknesses:")

                    Spacer()
                    
                    Text(pokemon.weaknesses)
                }
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.bottom, 20)
                
                Divider()
                
                Text("Description")
                    .font(.title2)
                    .padding(.bottom, 3)
                    .padding(.top, 20)
                
                Text(pokemon.description)
                    .padding(.bottom, 20)
                
                Text("Evolutions")
                    .font(.title2)
                    .padding(.bottom, 3)
                
                HStack {
                    Text(pokemon.evolutions)
                        .padding(.bottom, 3)
                }
//                
//                Text(pokemon.evolutions)
//                    .padding(.bottom, 20)
            }
            .padding()
            .padding(.top, 120)
        }
        .background(Color.white)
        .foregroundColor(.black)
        .ignoresSafeArea(.all)
        .navigationBarTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct pokdexDetail_Previews: PreviewProvider {
    static var previews: some View {
        pokedexDetail(pokemon: pokemon[0]).preferredColorScheme(.light)
    }
}

