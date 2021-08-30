//
//  PGenList.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct PokedexGenList: View {
    var body: some View {
        List{
            HStack {
                Image("#001 Bulbasaur")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: Gen1Pokedex()) {
                    Text("Generation 1")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Generations")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("Pokedex")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Generations 2-8")
                    .font(.title2)
                    .fontWeight(.light)
                Spacer()
                Text("Coming Soon...")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }

        }
        .navigationBarTitle(Text("Generations"), displayMode: .inline)
        .padding(.top, 20)
    }
}

struct PokedexGenList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexGenList()
    }
}
