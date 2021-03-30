//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 6/3/20.
//  Copyright © 2020 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0 / 255/0, green: 51.0 / 255.0, blue: 102.0 / 255.0)

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
                Text("\(target)")
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
                        "The slider's value is \(sliderValueRounded()).\n" +
                            "You scored \(pointsForCurrentRound()) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score += self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
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
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
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
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
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
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
