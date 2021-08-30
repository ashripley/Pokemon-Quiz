//
//  ContentView.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 30/7/21.
//  This app is a pokemon quiz game, designed and created by Ash Bronca
//

import SwiftUI

// Main content view to display app
struct ContentView: View {
    var body: some View {
        WelcomeScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
