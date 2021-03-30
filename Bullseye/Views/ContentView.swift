//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 6/3/20.
//  Copyright © 2020 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var game: Game = Game()
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
                Text("\(self.game.target)")
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
                    self.alertIsVisible = true
                }) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $alertIsVisible) {() -> Alert in
                    return Alert(title: Text("\(alertTitle())"), message: Text(
                        "The slider's value is \(self.game.sliderValueRounded(value: sliderValue)).\n" +
                            "You scored \(self.game.points(sliderValue: self.game.sliderValueRounded(value: sliderValue))) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.game.score += game.points(sliderValue: self.game.sliderValueRounded(value: sliderValue))
                        self.game.target = Int.random(in: 1...100)
                        self.game.round += 1
                    })
                }
            }
            Spacer()
            
            HStack {
                Button(action: { self.resetGame() }) {
                    HStack {
                        Text("Start over")
                    }
                }
                Spacer()
                Text("Score:")
                Text("\(self.game.score)")
                Spacer()
                Text("Round:")
                Text("\(self.game.round)")
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
        let difference = self.game.amountOff(value: self.game.sliderValueRounded(value: sliderValue))
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
        self.sliderValue = 50.0
        self.game.target = Int.random(in: 1...100)
        self.game.score = 0
        self.game.round = 1
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
