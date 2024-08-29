//
//  ContentView.swift
//  lecture2
//
//  Created by Fettah KIRAN on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var seasons = ["Spring", "Fall","Summer","Winter"]
    @State private var seasonImages = [
        "weather_1",
        "weather_2",
        "weather_3",
        "weather_4"
    ]
    @State private var seasonIdx = 0
//    @State private var seasonInput = ""
    @State private var showingActionSheet = false
//    @State private var showingAlert = false
    
    
    var body: some View {
        VStack(spacing:20) {
                   
            Spacer()
            Text(seasons[seasonIdx])
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(seasonImages[seasonIdx])
                .resizable()
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fit) //
                .padding()
            
            
            Spacer()
            
            VStack{
                Button(action:
                        {showNextSeasonWeather()
                }
                ){
                    Text("Next Season")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title).fontWeight(.bold)
                        .background(Color(red: 23/255, green: 155.0/255, blue: 14.0/255))
                        .foregroundColor(.white)
                }
//                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text(" \(seasons[(seasonIdx + 1) % seasonImages.count]) is coming"),
//                          message: Text(" Message goes here"),
//
//                          dismissButton: .default(Text("OK"))
//                    )
//                }

                
                
                Button(action:
                        {showingActionSheet = true }
                ){
                    Text("Select Season")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title).fontWeight(.bold)
                        .background(.orange)
                        .foregroundColor(.white)
                }
                .actionSheet(isPresented: $showingActionSheet){
                    ActionSheet(title: Text("Pick a season"), buttons: createActionSheetButtons())
                }

                
                
                
            }.padding()
            Spacer()
            
        }
        Spacer()
    }
    
    
    func showNextSeasonWeather(){
//        if seasonInput.isEmpty {
            seasonIdx = (seasonIdx + 1) % seasonImages.count
//            showingAlert = true
//        }
    }
    
    func createActionSheetButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = seasons.map{
            season in .default(Text(season)){
                seasonIdx = seasons.firstIndex(of: season) ?? 0
                
            }
        }
        buttons.append(.cancel())

        return buttons
    }
    
    
}

#Preview {
    ContentView()
}

