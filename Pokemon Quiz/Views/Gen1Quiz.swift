//
//  Quiz.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 20/8/21.
//

import SwiftUI

struct Gen1ImageQuiz: View {
    // Properties
    var imageName: String

    var body: some View {
        // View Code
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 225, height: 225)
    }
}

struct Gen1Quiz: View {
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showingScore = false
    @State private var endOfGame = false
    
    @State private var pokemonName = ["#001 Bulbasaur", "#002 Ivysaur", "#003 Venasaur",
                                      "#004 Charmander", "#005 Charmeleon", "#006 Charizard",
                                      "#007 Squirtle", "#008 Wartortle", "#009 Blastoise",
                                      "#010 Caterpie", "#011 Metapod", "#012 Butterfree",
                                      "#013 Weedle", "#014 Kakuna", "#015 Beedrill",
                                      "#016 Pidgey", "#017 Pidgeotto", "#018 Pidgeot",
                                      "#019 Rattata", "#020 Raticate", "#021 Spearow",
                                      "#022 Fearow", "#023 Ekans", "#024 Arbok",
                                      "#025 Pikachu", "#026 Raichu", "#027 Sandshrew",
                                      "#028 Sandslash", "#029 Nidoran", "#030 Nidorina",
                                      "#031 Nidoqueen", "#032 Nidoran", "#033 Nidorino",
                                      "#034 Nidoking", "#035 Clefairy", "#036 Clefable",
                                      "#037 Vulpix", "#038 Ninetales", "#039 Jigglypuff",
                                      "#040 Wigglytuff", "#041 Zubat", "#042 Golbat",
                                      "#043 Oddish", "#044 Gloom", "#045 Vileplume",
                                      "#046 Paras", "#047 Parasect", "#048 Venonat",
                                      "#049 Venomoth", "#050 Diglett", "#051 Dugtrio",
                                      "#052 Meowth", "#053 Persian", "#054 Psyduck",
                                      "#055 Golduck", "#056 Mankey", "#057 Primeape",
                                      "#058 Growlithe", "#059 Arcanine", "#060 Poliwag",
                                      "#061 Poliwhirl", "#062 Poliwrath", "#063 Abra",
                                      "#064 Kadabra", "#065 Alakazam", "#066 Machop",
                                      "#067 Machoke", "#068 Machamp", "#069 Bellsprout",
                                      "#070 Weepinbell", "#071 Victreebel", "#072 Tentacool",
                                      "#073 Tentacruel", "#074 Geodude", "#075 Graveler",
                                      "#076 Golem", "#077 Ponyta", "#078 Rapidash",
                                      "#079 Slowpoke", "#080 Slowbro", "#081 Magnemite",
                                      "#082 Magneton", "#083 Farfetch'd", "#084 Doduo",
                                      "#085 Dodrio", "#086 Seel", "#087 Dewgong",
                                      "#088 Grimer", "#089 Muk", "#090 Shellder",
                                      "#091 Cloyster", "#092 Gastly", "#093 Haunter",
                                      "#094 Gengar", "#095 Onix", "#096 Drowzee",
                                      "#097 Hypno", "#098 Krabby", "#099 Kingler",
                                      "#100 Voltorb", "#101 Electrode", "#102 Exeggcute",
                                      "#103 Exeggutor", "#104 Cubone", "#105 Marowak",
                                      "#106 Hitmonlee", "#107 Hitmonchan", "#108 Lickitung",
                                      "#109 Koffing", "#110 Weezing", "#111 Rhyhorn",
                                      "#112 Rhydon", "#113 Chansey", "#114 Tangela",
                                      "#115 Kangaskhan", "#116 Horsea", "#117 Seadra",
                                      "#118 Goldeen", "#119 Seaking", "#120 Staryu",
                                      "#121 Starmie", "#122 Mr. Mime", "#123 Scyther",
                                      "#124 Jynx", "#125 Electabuzz", "#126 Magmar",
                                      "#127 Pinsir", "#128 Tauros", "#129 Magikarp",
                                      "#130 Gyarados", "#131 Lapras", "#132 Ditto",
                                      "#133 Eevee", "#134 Vaporeon", "#135 Jolteon",
                                      "#136 Flareon", "#137 Porygon", "#138 Omanyte",
                                      "#139 Omastar", "#140 Kabuto", "#141 Kabutops",
                                      "#142 Aerodactyl", "#143 Snorlax", "#144 Articuno",
                                      "#145 Zapdos", "#146 Moltres", "#147 Dratini",
                                      "#148 Dragonair", "#149 Dragonite", "#150 Mewtwo",
                                      "#151 Mew"].shuffled()
    var body: some View {
        VStack{
            VStack {
                Text("What is this Pokemon?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                    .padding(.top, 40)
                Text("Question \(currentRound) / 20")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 50)
                Gen1ImageQuiz(imageName: pokemonName[correctIndexAnswer])
                    .padding(.bottom, 20)
                Form {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.pokemonTapped(number)
                        }) {
                            Text(self.pokemonName[number])
                        }
                    }
                }
                .padding(.vertical)
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text("Incorrect!"), message: Text(answerText), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
            HStack {
                Text("Your current score:")
                    .fontWeight(.bold)

                Text("\(String(gameScore)) / 20")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.bottom, 30)
            .alert(isPresented: $endOfGame) {
                Alert(title: Text(endOfGameText), message: Text("Your final score was \(gameScore) / 20"), dismissButton: .default(Text("New Game")) {
                    self.resetGame()
                })
            }
        }
    }
    
    
    // Methods
    func pokemonTapped(_ number: Int) {
        if currentRound >= 20 {
            endOfGameText = "Game Over!"
            gameOver()
        }

        if number == correctIndexAnswer && currentRound >= 20 {
            gameScore += 1
            self.askQuestion()
        }else if number == correctIndexAnswer {
            gameScore += 1
            self.askQuestion()
            currentRound += 1
        } else if number != correctIndexAnswer && currentRound >= 20 {
            endOfGameText = "Game Over!"
            gameOver()
        }else {
        answerText = "Check out the Pokedex to brush up your knowledge!"
        wrongAnswer()
        currentRound += 1
        }
    }

    func askQuestion() {
        pokemonName.shuffle()
        correctIndexAnswer = Int.random(in: 0...2)
    }

    func gameOver() {
        endOfGame = true
    }

    func wrongAnswer() {
        showingScore = true
    }

    func resetGame() {
        gameScore = 0
        currentRound = 1
        askQuestion()
    }
}

struct Gen1Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Gen1Quiz()
    }
}
