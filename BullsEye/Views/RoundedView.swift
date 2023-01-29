//
//  RoundedView.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/21/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokewidth))
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
    )
                }
}

struct RoundedRecTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundedViewLenght)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokewidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
                )
                }
}
struct RoundedTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokewidth))
    }
}
        
struct PreviewView: View {
    var body: some View {
        VStack{
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRecTextView(text: "100")
            RoundedTextView(text:"1")
            
        }
        }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
        
    }
}
