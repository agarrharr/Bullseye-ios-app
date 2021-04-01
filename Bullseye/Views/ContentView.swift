//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 6/3/20.
//  Copyright © 2020 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game()
    @State private var sliderValue = 50.0
    
    @State private var alertIsVisible = false

    let midnightBlue = Color(red: 0.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)

    var body: some View {
        ZStack {
            BackgroundView(game: $game)

            VStack {
                Instructions(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
            }
            .accentColor(Color("AccentColor")) // I shouldn't have to do this?
            .navigationBarTitle("Bullseye")
            .padding()
        }
    }
    
    struct Instructions: View {
        @Binding var game: Game
        
        var body: some View {
            VStack {
                InstructionText()
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                BigNumberText(number: "\(game.target)")
            }
        }
    }
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: $sliderValue, in: 1...100)
                SliderLabelText(text: "100")
            }
        }
    }
    
    struct HitMeButton: View {
        @Binding var game: Game
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        
        var body: some View {
            Button(action: {
                alertIsVisible = true
            }) {
                Text("Hit me".uppercased())
                    .bold()
                    .font(.body) // should be .title3, but only available on iOS 14+
            }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    
                }
            )
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .strokeBorder(Color.white, lineWidth: 2.0)
            )
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = game.sliderValueRounded(value: sliderValue);
                let points = game.points(sliderValue: roundedValue)
                
                return Alert(title: Text(game.alertTitle(sliderValue: sliderValue)), message: Text(
                    "The slider's value is \(roundedValue).\n" +
                        "You scored \(points) points this round."
                ), dismissButton: .default(Text("Awesome!")) {
                    game.startNewRound(points: points)
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 896, height: 414))
            ContentView()
                .preferredColorScheme(.dark)
            ContentView().previewLayout(.fixed(width: 896, height: 414))
                .preferredColorScheme(.dark)
        }
    }
}
