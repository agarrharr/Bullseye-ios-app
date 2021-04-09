//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Adam Garrett-Harris on 4/9/21.
//  Copyright © 2021 Adam Garrett-Harris. All rights reserved.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShown: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShown: $leaderboardIsShown)
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)

    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShown: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShown = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShown = Binding.constant(false)
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShown: leaderboardIsShown)
            .previewDevice("iPhone 7")
        LeaderboardView(leaderboardIsShown: leaderboardIsShown)
            .previewLayout(.fixed(width: 896, height: 414))
        LeaderboardView(leaderboardIsShown: leaderboardIsShown)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShown: leaderboardIsShown)
            .previewLayout(.fixed(width: 896, height: 414))
            .preferredColorScheme(.dark)
    }
}