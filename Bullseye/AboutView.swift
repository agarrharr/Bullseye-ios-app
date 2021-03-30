//
//  AboutView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 3/30/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group{
            VStack(alignment: .center) {
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider").modifier(TextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. Theh closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(TextStyle())
            }
            .background(Color.init(red: 1, green: 214.0 / 255.0, blue: 179.0 / 255.0))
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
