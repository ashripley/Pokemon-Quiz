//
//  HomeScreen.swift
//  Pokemon Quiz
//
//  Created by Kat and Ash on 19/8/21.
//

import SwiftUI

struct HomeScreen: View {

    var body: some View {
        List {
            HStack {
                Image("Pokedex")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: PokedexGenList()) {
                    Text("Pokedex")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Games")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("Pokeball")
                    .resizable()
                    .frame(width: 30, height: 30)
                NavigationLink(destination: QuizGenList()) {
                    Text("Quiz")
                        .font(.title2)
                        .fontWeight(.light)
                        .navigationBarTitle("Games")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            HStack {
                Image("WaterType")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Types")
                    .font(.title2)
                    .fontWeight(.light)
                Spacer()
                Text("Coming Soon...")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
        }
        .navigationBarTitle(Text("Games"), displayMode: .inline)
        .padding(.top, 20)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
