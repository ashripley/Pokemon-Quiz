//
//  Gen2Quiz.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 21/8/21.
//

import SwiftUI

struct Gen2ImageQuiz: View {
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

struct Gen2Quiz: View {
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showingScore = false
    @State private var endOfGame = false
    
    @State private var pokemonName = ["#152 Chikorita", "#153 Bayleef", "#154 Meganium",
                                      "#155 Cyndaquil", "#156 Quilava", "#157 Typhlosion",
                                      "#158 Totodile", "#159 Croconaw", "#160 Feraligatr",
                                      "#161 Sentret", "#162 Furret", "#163 Hoothoot",
                                      "#164 Noctowl", "#165 Ledyba", "#166 Ledian",
                                      "#167 Spinarak", "#168 Ariados", "#169 Crobat",
                                      "#170 Chinchou", "#171 Lanturn", "#172 Pichu",
                                      "#173 Cleffa", "#174 Igglybuff", "#175 Togepi",
                                      "#176 Togetic", "#177 Natu", "#178 Xatu",
                                      "#179 Mareep", "#180 Flaffy", "#181 Ampharos",
                                      "#182 Bellossom", "#183 Marill", "#184 Azumarill",
                                      "#185 Sudowoodo", "#186 Politoed",
                                      "#187 Hoppip", "#188 Skiploom", "#189 Jumpluff",
                                      "#190 Aipom", "#191 Sunkern", "#192 Sunflora",
                                      "#193 Yanma", "#194 Wooper", "#195 Quagsire",
                                      "#196 Espeon", "#197 Umbreon", "#198 Murkrow",
                                      "#199 Slowking", "#200 Misdreavus", "#201 Unknown",
                                      "#202 Wobbuffet", "#203 Girafarig", "#204 Pineco",
                                      "#205 Forretress", "#206 Dunsparce", "#207 Gligar",
                                      "#208 Steelix", "#209 Snubbull", "#210 Granbull",
                                      "#211 Qwilfish", "#212 Scizor", "#213 Shuckle",
                                      "#214 Heracross", "#215 Sneasel", "#216 Teddiursa",
                                      "#217 Ursaring", "#218 Slugma", "#219 Magcargo",
                                      "#220 Swinub", "#221 Piloswine", "#222 Corsola",
                                      "#223 Remoraid", "#224 Octillery", "#225 Delibird",
                                      "#226 Mantine", "#227 Skarmory", "#228 Houndour",
                                      "#229 Houndoom", "#230 Kingdra", "#231 Phanpy",
                                      "#232 Donphan", "#233 Porygon 2", "#234 Stantler",
                                      "#235 Smeargle", "#236 Tyrogue", "#237 Hitmontop",
                                      "#238 Smoochum", "#239 Elekid", "#240 Magby",
                                      "#241 Miltank", "#242 Blissey", "#243 Raikou",
                                      "#244 Entei", "#245 Suicune", "#246 Larvitar",
                                      "#247 Pupitar", "#248 Tyranitar", "#249 Lugia",
                                      "#250 Ho-Oh", "#251 Celebi"
                                      ].shuffled()
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
                Gen2ImageQuiz(imageName: pokemonName[correctIndexAnswer])
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

struct Gen2Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Gen2Quiz()
    }
}
