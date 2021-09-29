//
//  HomeScreen.swift
//  Pokemon Quiz
//
//  Created by Ash on 19/8/21.
//

import SwiftUI

struct HomeScreen: View {

    var body: some View {
        Form {
            Section {
                HStack {
                    Image("Pokedex")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    NavigationLink(destination: PokedexGenList()) {
                        Text("Pokedex")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Games")
                    }
                }
                .padding(.vertical, 10)
            
                HStack {
                    Image("pokemonQuiz")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    NavigationLink(destination: QuizGenList()) {
                        Text("Quiz")
                            .font(.title3)
                            .fontWeight(.light)
                            .navigationBarTitle("Games")
                    }
                }
                .padding(.vertical, 10)
            }
            
            Section {
                HStack {
                    Image("WaterType")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Types")
                        .font(.title3)
                        .fontWeight(.light)
                    Spacer()
                    Text("Coming Soon...")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
                
                HStack {
                    Image("pokemonCard")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Card Flip")
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
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}






// Old List format

//var body: some View {
//    List {
//        HStack {
//            Image("Pokedex")
//                .resizable()
//                .frame(width: 30, height: 30)
//            NavigationLink(destination: PokedexGenList()) {
//                Text("Pokedex")
//                    .font(.title3)
//                    .fontWeight(.light)
//                    .navigationBarTitle("Games")
////                        .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//        HStack {
//            Image("Pokeball")
//                .resizable()
//                .frame(width: 30, height: 30)
//            NavigationLink(destination: QuizGenList()) {
//                Text("Quiz")
//                    .font(.title3)
//                    .fontWeight(.light)
//                    .navigationBarTitle("Games")
////                        .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//        HStack {
//            Image("WaterType")
//                .resizable()
//                .frame(width: 30, height: 30)
//            Text("Types")
//                .font(.title3)
//                .fontWeight(.light)
//            Spacer()
//            Text("Coming Soon...")
//                .font(.footnote)
//                .fontWeight(.light)
//                .foregroundColor(.gray)
//        }
//    }
////        .navigationBarTitle(Text("Games"), displayMode: .inline)
////        .padding(.top, 20)
//}
//}
