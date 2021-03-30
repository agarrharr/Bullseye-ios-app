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
        VStack {
            Spacer()
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                Text("\(game.target)")
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            Spacer()
            
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .bold()
            }
            Spacer()
            HStack {
                Button(action: {
                    alertIsVisible = true
                }) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = game.sliderValueRounded(value: sliderValue);
                    
                    return Alert(title: Text("\(alertTitle())"), message: Text(
                        "The slider's value is \(roundedValue).\n" +
                            "You scored \(game.points(sliderValue: roundedValue)) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        game.score += game.points(sliderValue: game.sliderValueRounded(value: sliderValue))
                        game.target = Int.random(in: 1...100)
                        game.round += 1
                    })
                })
            }
            Spacer()
            
            HStack {
                Button(action: { resetGame() }) {
                    HStack {
                        Text("Start over")
                    }
                }
                Spacer()
                Text("Score:")
                Text("\(game.score)")
                Spacer()
                Text("Round:")
                Text("\(game.round)")
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Text("Info")
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    func alertTitle() -> String {
        let difference = game.amountOff(value: game.sliderValueRounded(value: sliderValue))
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if  difference < 5 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetGame() -> Void {
        sliderValue = 50.0
        game.target = Int.random(in: 1...100)
        game.score = 0
        game.round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
