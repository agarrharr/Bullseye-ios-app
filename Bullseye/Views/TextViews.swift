//
//  TextViews.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 3/31/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct InstructionText: View {
    var body: some View {
        Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))

    }
}

struct BigNumberText: View {
    var number: String
    
    var body: some View {
        Text(number)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)

    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
        
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText()
            BigNumberText(number: "99")
            SliderLabelText(text: "1")
            LabelText(text: "9")
        }
    }
}
