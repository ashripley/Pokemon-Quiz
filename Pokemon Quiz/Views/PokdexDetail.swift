//
//  PokdexDetail.swift
//  Pokemon Quiz
//
//  Created by Ash on 19/8/21.
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

            VStack(alignment: .center) {
                Text(pokemon.number)
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Text(pokemon.name)
                    .font(.title)
                    .padding(.bottom, 10)
                
                Divider()
                
                VStack {
                    Text("Type")
                        .padding(.all, 10)
                    
                    HStack{
                        // It is here that I am wanting to bring in the dynamic types
                        // I have reverted the type array in JSON file to just be a string, and same in the Pokemon model
                        // I have set them statically currently so you can see what I mean :)

                        Image(pokemon.type)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 150, height: 25)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 8).padding(.all, -30))
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).clipShape(Rectangle())
                            .shadow(radius: 7)

                        Image(pokemon.type)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 150, height: 25)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 8).padding(.all, -30))
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).clipShape(Rectangle())
                            .shadow(radius: 7)
                    }
                }
                .font(.subheadline)
                .foregroundColor(.black)
                
                VStack {
                    Text("Weaknesses")
                        .padding(.all, 10)

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

