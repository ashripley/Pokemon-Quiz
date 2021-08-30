//
//  AllGenQuiz.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 22/8/21.
//

import SwiftUI

struct AllGenImageQuiz: View {
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

struct AllGenQuiz: View {
    
    @State private var correctIndexAnswer = 0
    @State private var answerText = ""
    @State private var endOfGameText = ""
    @State private var gameScore = 0
    @State private var currentRound = 1
    @State private var showingScore = false
    @State private var endOfGame = false
    
    @State private var pokemonName = [ // Gen 1
                                      "#001 Bulbasaur", "#002 Ivysaur", "#003 Venasaur",
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
                                      "#097 Hypno", "#098 Crabby", "#099 Kingler",
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
                                      "#145 Zaptos", "#146 Moltres", "#147 Dratini",
                                      "#148 Dragonair", "#149 Dragonite", "#150 Mewtwo",
                                      "#151 Mew",
                                      // Gen 2
                                      "#152 Chikorita", "#153 Bayleef", "#154 Meganium",
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
                                      "#250 Ho-Oh", "#251 Celebi",
                                      // Gen 3
                                      "#252 Treecko", "#253 Grovyle", "#254 Sceptile",
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
                                      // Gen 4
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
                AllGenImageQuiz(imageName: pokemonName[correctIndexAnswer])
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


struct AllGenQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AllGenQuiz()
    }
}
