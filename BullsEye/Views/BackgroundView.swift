//
//  BackgroundView.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/21/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
        
    }
}
struct TopView: View{
    @Binding var game: Game
    @State var leaderboardIsShowing = false
    
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {leaderboardIsShowing = true})
            {
            RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
                
            })
    }
    }
}
struct NumberView: View{
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title.uppercased())
            RoundedRecTextView(text: text)
        }
    }
}
struct BottomView: View{
    @Binding var game: Game
    
    var body: some View{
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}
struct RingsView: View{
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        
            ForEach(1..<6) { ring in
                let size = ring * 100
                let opacity = colorScheme == .dark ? 0.1 : 0.3
            Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity), Color("RingColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
                    
                .frame(width: CGFloat(size), height: CGFloat(size))
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game:.constant(Game()))
    }
}
