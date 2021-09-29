//
//  QGenList.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct QuizGenList: View {
    var body: some View {
        Form{
            Section{
                HStack {
                    Image("#001 Bulbasaur")
                        .resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination: Gen1Quiz()) {
                        Text("Generation 1")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Generations")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.vertical, 10)
                
                HStack {
                    Image("#152 Chikorita")
                        .resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination: Gen2Quiz()) {
                        Text("Generation 2")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Generations")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.vertical, 10)
                
                HStack {
                    Image("#252 Treecko")
                        .resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination: Gen3Quiz()) {
                        Text("Generation 3")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Generations")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.vertical, 10)
                
                HStack {
                    Image("PokemonLogo")
                        .resizable()
                        .frame(width: 50, height: 23)
                    NavigationLink(destination: AllGenQuiz()) {
                        Text("All Generations")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Generations")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                .padding(.vertical, 22)
            }
            
            HStack {
                Image("Pokeball")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Generations 4-8")
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

struct QuizGenList_Previews: PreviewProvider {
    static var previews: some View {
        QuizGenList()
    }
}
