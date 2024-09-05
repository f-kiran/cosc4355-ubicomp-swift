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
    @State private var isNameEditSheetPresented: Bool = false
    @State private var seasonToEdit: String = ""
    
    var body: some View {
        VStack(spacing:10) {
            Spacer()
            HStack {
                Spacer()
                Button(action:
                        { seasonToEdit = seasons[seasonIdx]
                    isNameEditSheetPresented = true}
                ){
                    Text("\(Image( systemName: "pencil")) Edit ")
                        .padding()
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isNameEditSheetPresented){
                    
                    EditSeasonView(seasonName: $seasonToEdit, onSave: {
                        updateNameonSave()
                    }
                    )
                }
                
            }
            
            Spacer()
            SeasonView(seasons: seasons, seasonImages: seasonImages, seasonIdx: seasonIdx)
            
            
            Spacer()
            
            VStack{
                Button(action:
                        {
                    showNextSeasonWeather()
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
                
                
//                Button(action:
//                        { seasonToEdit = seasons[seasonIdx]
//                    isCardNameEditSheetPresented = true}
//                ){
//                    Text("Edit Season Name")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .font(.title).fontWeight(.bold)
//                        .background(.orange)
//                        .foregroundColor(.white)
//                }
//                .sheet(isPresented: $isCardNameEditSheetPresented){
//                    
//                    EditSeasonView(seasonName: $seasonToEdit, onSave: {
//                        updateNameonSave()
//                    }
//                    )
//                }
                
            }.padding() // Vstack ends
            
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
    
    
    // onSave function to update the season name in the array
    func updateNameonSave() {
        // Update the season name in the seasons array
        if let index = seasons.firstIndex(of: seasons[seasonIdx]) {
            seasons[index] = seasonToEdit
        }
    }
    
    
}

#Preview {
    ContentView()
}

