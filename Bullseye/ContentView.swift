//
//  ContentView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 6/3/20.
//  Copyright © 2020 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            HStack {
                Button(action: {self.alertIsVisible = true}) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $alertIsVisible) {() -> Alert in
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello there!"), message: Text(
                        "The slider's value is \(roundedValue).\n" +
                        "You scored \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")))
                }
            }
            Spacer()
            
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
            
            // Score row
        }
    }
    
    func pointsForCurrentRound() -> Int {
        return 999
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
