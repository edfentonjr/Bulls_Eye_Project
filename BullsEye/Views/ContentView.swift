//
//  ContentView.swift
//  BullsEye
//
//  Created by FENTON, EDWARD F on 3/12/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var alertIsVisable = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisable ? 0 : 100)
                if alertIsVisable{
                    PointsView(alertIsVisable: $alertIsVisable, sliderValue: $sliderValue, game: $game)
                        
                }else {
                HitmeButton(alertIsVisable: $alertIsVisable, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                    
                          }
            }
            if !alertIsVisable{
            SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
            }
        
    }
}
struct InstructionView: View {
    @Binding var game: Game
    
    
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯 \nPut the BullsEye as Close as you can to")
                .padding(.leading, 20.0)
                .padding(.trailing, 20.0)
            BigNumberText(text: String(game.target))
        }
    }
    
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack {

            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
           
        }.padding()
    }
    
}

struct HitmeButton: View {
    @Binding var alertIsVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View{
        Button(action: {
            withAnimation{
                self.alertIsVisable = true
            }
        }){
        Text("Hit Me".uppercased())
            .bold()
            .font(.title3)
        }
            .padding(20.0)
            .font(.title3.bold())
            .background(
                
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
            .foregroundColor(Color.white)
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius).strokeBorder(Color.white, lineWidth: Constants.General.strokewidth)
            )
            
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 528, height: 320))
        }
        Group{
            
            ContentView().preferredColorScheme(.dark)
            ContentView()
                .previewLayout(.fixed(width: 528, height: 320))
                .preferredColorScheme(.dark)
        }
        
        
    }
}
}
