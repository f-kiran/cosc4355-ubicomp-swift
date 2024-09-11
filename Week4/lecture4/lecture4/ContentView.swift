//
//  ContentView.swift
//  lecture4
//
//  Created by Fettah KIRAN on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalSameCards = 0
    @State private var totalDiffCards = 0
    
    var body: some View {
        VStack {
            
            TabView {
                GameView(totalSameCards: $totalSameCards, totalDiffCards: $totalDiffCards)
                StatView(totalSameCards: $totalSameCards, totalDiffCards: $totalDiffCards)
                    .badge(totalSameCards)
            }
            
        }
        .padding(15)
        .background(.linearGradient(colors: [.orange,.white,.white], startPoint: .center, endPoint: .bottom))
        .cornerRadius(15.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDisplayName("Portrait")
        
        ContentView().previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("Landscape Left")
    }
}
