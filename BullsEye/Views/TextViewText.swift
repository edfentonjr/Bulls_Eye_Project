//
//  TextViewText.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/20/22.
//

import SwiftUI

struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center).lineSpacing(4.0)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View{
        Text(String(text))
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
        
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
struct BodyTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(10.0)
            
    }
}
struct ButtonTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12.0)
            
    }
}
struct ScoreTextView: View{
    let score: Int
    var body: some View {
       Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateTextView: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}
struct BigBoldText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
        
    }
}
           

struct TextViewText_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        InstructionText(text: "Instructions")
        BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text:"9")
            BodyTextView(text: "You score 200 points \n\n🎉🎉🎉")
            ButtonTextView(text: "Start New Round")
            ScoreTextView(score: 250)
            DateTextView(date: .now)
            BigBoldText(text: "Leaderboard")
            
        }
        .padding()
        }
}
