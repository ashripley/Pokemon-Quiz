//
//  TypeImage.swift
//  Pokemon Quiz
//
//  Created by Ash Bronca on 29/9/21.
//

import SwiftUI

struct TypeImage: View {
    
    var image: Image

    var body: some View {
        
        types
            .renderingMode(.original)
            .resizable()
            .frame(width: 250, height: 250)
            .padding(20)
            .overlay(Rectangle().stroke(Color.white, lineWidth: 8).padding(.all, -30))
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(radius: 7)
    //            .clipShape(Circle())
    //            .background(Color.white)
    //            .cornerRadius(25) // take off as you wish
    }
}


struct TypeImage_Previews: PreviewProvider {
    static var previews: some View {
        TypeImage(image: Image("Fire"))
    }
}
