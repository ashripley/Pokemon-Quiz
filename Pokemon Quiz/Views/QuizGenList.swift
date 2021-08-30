//
//  QGenList.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct QuizGenList: View {
    var body: some View {
        List{
            HStack {
                Image("#001 Bulbasaur")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: Gen1Quiz()) {
                    Text("Generation 1")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Generations")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("#152 Chikorita")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: Gen2Quiz()) {
                    Text("Generation 2")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Generations")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("#252 Treecko")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: Gen3Quiz()) {
                    Text("Generation 3")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Generations")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("PokemonLogo")
                    .resizable()
                    .frame(width: 30, height: 15)
                NavigationLink(destination: AllGenQuiz()) {
                    Text("All Generations")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Generations")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("Pokeball")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Generations 4-8")
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

struct QuizGenList_Previews: PreviewProvider {
    static var previews: some View {
        QuizGenList()
    }
}
