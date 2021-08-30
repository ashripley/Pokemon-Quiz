//
//  Gen3Quiz.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 22/8/21.
//

import SwiftUI

struct Gen3ImageQuiz: View {
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

struct Gen3Quiz: View {
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showingScore = false
    @State private var endOfGame = false
    
    @State private var pokemonName = ["#252 Treecko", "#253 Grovyle", "#254 Sceptile",
                                      "#255 Torchic", "#256 Combusken", "#257 Blaziken",
                                      "#258 Mudkip", "#259 Marshtomp", "#260 Swampert",
                                      "#261 Poochyena", "#262 Mightyena", "#263 Zigzagoon",
                                      "#264 Linoone", "#265 Wurmple", "#266 Silcoon",
                                      "#267 Beautifly", "#268 Cascoon", "#269 Dustox",
                                      "#270 Lotad", "#271 Lombre", "#272 Ludicolo",
                                      "#273 Seedot", "#274 Nuzleaf", "#275 Shiftry",
                                      "#276 Taillow", "#277 Swellow", "#278 Wingull",
                                      "#279 Pelipper", "#280 Ralts", "#281 Kirlia",
                                      "#282 Gardevoir", "#283 Surskit", "#284 Masquerain",
                                      "#285 Shroomish", "#286 Breloom", "#287 Slakoth",
                                      "#288 Vigoroth", "#289 Slaking", "#290 Nincada",
                                      "#291 Ninjask", "#292 Shedinja", "#293 Whismur",
                                      "#294 Loudred", "#295 Exploud", "#296 Makuhita",
                                      "#297 Hariyama", "#298 Azurill", "#299 Nosepass",
                                      "#300 Skitty", "#301 Delcatty", "#302 Sableye",
                                      "#303 Mawile", "#304 Aron", "#305 Lairon",
                                      "#306 Aggron", "#307 Meditite", "#308 Medicham",
                                      "#309 Electrike", "#310 Manectric", "#311 Plusle",
                                      "#312 Minun", "#313 Volbeat", "#314 Illumise",
                                      "#315 Roselia", "#316 Gulpin", "#317 Swalot",
                                      "#318 Carvanha", "#319 Sharpedo", "#320 Wailmer",
                                      "#321 Wailord", "#322 Numel", "#323 Camerupt",
                                      "#324 Torkoal", "#325 Spoink", "#326 Grumpig",
                                      "#327 Spinda", "#328 Trapinch", "#329 Vibrava",
                                      "#330 Flygon", "#331 Cacnea", "#332 Cacturne",
                                      "#333 Swablu", "#334 Altaria", "#335 Zangoose",
                                      "#336 Seviper", "#337 Lunatone", "#338 Solrock",
                                      "#339 Barboach", "#340 Whiscash", "#341 Corphish",
                                      "#342 Crawdaunt", "#343 Baltoy", "#344 Claydol",
                                      "#345 Lileep", "#346 Cradily", "#347 Anorith",
                                      "#348 Armaldo", "#349 Feebas", "#350 Milotic",
                                      "#351 Castform", "#352 Kecleon", "#353 Shuppet",
                                      "#354 Banette", "#355 Duskull", "#356 Dusclops",
                                      "#357 Tropius", "#358 Chimecho", "#359 Absol",
                                      "#360 Wynaut", "#361 Snorunt", "#362 Glalie",
                                      "#363 Spheal", "#364 Sealeo", "#365 Walrein",
                                      "#366 Clamperl", "#367 Huntail", "#368 Gorebyss",
                                      "#369 Relicanth", "#370 Luvdisc", "#371 Bagon",
                                      "#372 Shelgon", "#373 Salamence", "#374 Beldum",
                                      "#375 Metang", "#376 Metagross", "#377 Regirock",
                                      "#378 Regice", "#379 Registeel", "#380 Latias",
                                      "#381 Latios", "#382 Kyogre", "#383 Groudon",
                                      "#384 Rayquaza", "#385 Jirachi", "#386 Deoxys"
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
                Gen3ImageQuiz(imageName: pokemonName[correctIndexAnswer])
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

struct Gen3Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Gen3Quiz()
    }
}
