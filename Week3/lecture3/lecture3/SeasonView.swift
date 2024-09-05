//
//  SeasonView.swift
//  lecture3
//
//  Created by Fettah KIRAN on 9/4/24.
//

import SwiftUI

struct SeasonView: View {

    var seasons: [String]
    var seasonImages:[String]
    var seasonIdx: Int
        
    init(seasons: [String], seasonImages: [String], seasonIdx: Int) {
        self.seasons = seasons
        self.seasonImages = seasonImages
        self.seasonIdx = seasonIdx
    }
    var body: some View {
        Text(seasons[seasonIdx])
            .font(.largeTitle)
            .fontWeight(.bold)
        
        Image(seasonImages[seasonIdx])
            .resizable()
            .frame(width: 350, height: 350)
            .aspectRatio(contentMode: .fit) //
            .padding()
    }
}

#Preview {
    SeasonView(seasons: ["Summer"], seasonImages: ["weather_1"], seasonIdx: 0)
}
