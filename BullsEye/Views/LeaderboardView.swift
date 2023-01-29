//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 4/11/22.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackGroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10)    {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(game.LeaderboardEntries.indices){ i in
                            let leaderboardEntry = game.LeaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreTextView(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateTextView(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .background(RoundedRectangle(cornerRadius: .infinity)
            .strokeBorder(Color("LeaderboardRowColor"),
                          lineWidth: Constants.General.strokewidth))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
    
}
struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ZStack{
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                    
                }else{
                    
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack{
                Spacer()
                Button(action:{leaderboardIsShowing = false}){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
            .padding(.top)
        }
    }
}
struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundRectViewWidth)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text:"Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestDate: true))
    static var previews: some View {
        Group {
            
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,  game: game)
                .previewLayout(.fixed(width: 528, height: 320))
        }
        Group{
            
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,  game: game).preferredColorScheme(.dark)
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing,  game: game)
                .previewLayout(.fixed(width: 528, height: 320))
                .preferredColorScheme(.dark)
        }
    }
}

