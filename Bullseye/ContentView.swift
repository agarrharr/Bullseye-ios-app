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
    @State var jokeIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to my first app!")
                .fontWeight(.semibold)
            Button(action: {self.alertIsVisible = true}) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {() ->
                Alert in
                return Alert(title: Text("Hello"), message: Text("this is my first popup"), dismissButton: .default(Text("Awesome!")))
            }
            Button(action: {self.jokeIsVisible = true}) {
                Text(/*@START_MENU_TOKEN@*/"Knock Knock"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $jokeIsVisible) {() ->
                Alert in
                return Alert(title: Text("Who's there?"), message: Text("Joe"), dismissButton: .default(Text("Awesome!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
