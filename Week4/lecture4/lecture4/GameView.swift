//
//  GameView2.swift
//  lecture4
//
//  Created by Fettah KIRAN on 9/11/24.
// https://github.com/TUNER88/iOSSystemSoundsLibrary?tab=readme-ov-file


import SwiftUI
import AVFoundation

struct GameView: View {
    @State private var img1: String = "2"
    @State private var img2: String = "3"

    
    @Binding var totalSameCards: Int
    @Binding var totalDiffCards: Int
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    

    
    var body: some View {
        VStack{
            Spacer()
            Text("Card Game")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .shadow(color: .orange, radius: 10, x: 8, y: 8)
            
            if verticalSizeClass == .regular
            {
            
                VStack {
                    Image(img1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(img2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
                .background(.green)
                .scaledToFit()
                .cornerRadius(10)
                
                Button(action: {
                    print("clicked")
                    shuffleImages()
                }, label: {
                    Text("Shuffle")
                        .font(.title2)
                        .frame(minWidth: 150,minHeight: 10)
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
            } else {
                HStack {
                    HStack(spacing:20) {
                        Image(img1)
                            .resizable()
                        .aspectRatio(contentMode: .fit)
                        Image(img2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    .background(.green)
                    .scaledToFit()
                    .cornerRadius(10)
                    
                    VStack {
                        Button(action: {
                            print("clicked")
                            shuffleImages()
                        }, label: {
                            Text("Shuffle")
                                .font(.title2)
                                .frame(minWidth: 150,minHeight: 10)
                                .padding()
                                .background(.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                    })
                    }
                }
                
            }
            Spacer()
            
        }
        .tabItem {
            Image(systemName: "gamecontroller.fill")
            Text("Game")
        }
        
        
    } // View ends
    
    func shuffleImages() {
        let cardNum1 = Int.random(in: 2..<9)
        let cardNum2 = Int.random(in: 2..<9)
        print(cardNum1)
        print(cardNum2)
        img1 = "\(cardNum1)"
        img2 = "\(cardNum2)"
        
        if cardNum1 == cardNum2 {
            totalSameCards += 1
            AudioServicesPlaySystemSound(1026)
            
        } else {
            totalDiffCards += 1
        }
    }
    
    
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(totalSameCards: .constant(2), totalDiffCards: .constant(3))
            .previewDisplayName("MainView Portrait")
        
        GameView(totalSameCards: .constant(2), totalDiffCards: .constant(3))
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("MainView Landscape")
    }
}
