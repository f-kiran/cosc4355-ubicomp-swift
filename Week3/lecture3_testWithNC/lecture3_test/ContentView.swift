//
//  ContentView.swift
//  lecture2
//
//  Created by Fettah KIRAN on 8/28/24.
//
// https://colorhunt.co/palette/ff8343f1dec6179bae4158a6

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
    @State private var showingActionSheet = false
    @State private var isNameEditSheetPresented:Bool = false
    @State private var seasonToEdit:String = ""

    @State private var isNameDetailsSheetPresented:Bool = false
    
    var body: some View {
        
        HStack {
            Button(action: {
                seasonToEdit = seasons[seasonIdx]
                isNameDetailsSheetPresented = true
                
            }, label: {
                Text("Details")
                    .padding()
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }).sheet(isPresented: $isNameDetailsSheetPresented){
                MyNavigationView(seasons: seasons, seasonName: $seasonToEdit, seasonIdx: seasonIdx)
            }
            Spacer()
            Button(action: {
                seasonToEdit = seasons[seasonIdx]
                isNameEditSheetPresented = true
                
            }, label: {
                Text("\(Image(systemName: "pencil")) Edit")
                    .padding()
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }).sheet(isPresented: $isNameEditSheetPresented){
                EditSeasonView(seasonName: $seasonToEdit, onSave: {
                    updateNameonSave()
                })
            }
            
        }
        
        VStack(spacing:20) {
            
            Spacer()

            SeasonView(seasons: seasons, seasonImages: seasonImages, seasonIdx: seasonIdx)
            
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
            seasonIdx = (seasonIdx + 1) % seasonImages.count
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
    
    
    
    func updateNameonSave(){
        // Update the season name in the seasons array
        if let index = seasons.firstIndex(of: seasons[seasonIdx]) {
            seasons[index] = seasonToEdit
        }
    }
    
    
}



#Preview {
    ContentView()
}

