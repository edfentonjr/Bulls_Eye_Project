//
//  PointsView.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/23/22.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing:10){
            InstructionText(text: "The Slider's value is:")
            BigNumberText(text: String(roundedValue))
            BodyTextView(text: "You score \(points) points \n\n🎉🎉🎉")
            Button(action:{
                withAnimation{
                alertIsVisable = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonTextView(text: "Start New Round")
            }
        }
           
            .frame(maxWidth: 300)
            .padding()
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
           
           
        }
        }
    


struct PointsView_Previews: PreviewProvider {
    static var alertIsVisable = Binding.constant(false)
    static var sliderValue = Binding.constant(50.0)
    static var game = Binding.constant(Game())
    static var previews: some View {
        Group {
            PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game)
            PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game)
                .previewLayout(.fixed(width: 528, height: 320))
        }
        Group{
            
         PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game).preferredColorScheme(.dark)
           PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game)
                .previewLayout(.fixed(width: 528, height: 320))
                .preferredColorScheme(.dark)
        }
    }
}
