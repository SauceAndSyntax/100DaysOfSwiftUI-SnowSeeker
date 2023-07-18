//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Nicolò Perino on 18.07.23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "figure.snowboarding")
                    .resizable()
                    .foregroundColor(.secondary)
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                VStack {
                    Text("Welcome to SnowSeeker!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay() {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1)
                }
                .rotationEffect(Angle(degrees: -5))
                
                
            }
            
            Text("Please select a resort from the letf-hand menu")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
