//
//  PointsView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 4/1/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(number: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    
    static var previews: some View {
        PointsView(game: Binding.constant(Game()), sliderValue: sliderValue, alertIsVisible: alertIsVisible)
        PointsView(game: Binding.constant(Game()), sliderValue: sliderValue, alertIsVisible: alertIsVisible).previewLayout(.fixed(width: 896, height: 414))
        PointsView(game: Binding.constant(Game()), sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .preferredColorScheme(ColorScheme.dark)
        PointsView(game: Binding.constant(Game()), sliderValue: sliderValue, alertIsVisible: alertIsVisible).previewLayout(.fixed(width: 896, height: 414))
            .preferredColorScheme(ColorScheme.dark)
    }
}
