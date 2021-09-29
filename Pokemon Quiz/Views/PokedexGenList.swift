//
//  PGenList.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct PokedexGenList: View {
    var body: some View {
        Form{
            Section{
                HStack {
                    Image("#001 Bulbasaur")
                        .resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination: Gen1Pokedex()) {
                        Text("Generation 1")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Generations")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.vertical, 10)
            }
            
            HStack {
                Image("Pokeball")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Generations 2-8")
                    .font(.title3)
                    .fontWeight(.light)
                Spacer()
                Text("Coming Soon...")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
        }
        .navigationBarTitle(Text("Generations"), displayMode: .inline)
//        .padding(.top, 20)
    }
}

struct PokedexGenList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexGenList()
    }
}
