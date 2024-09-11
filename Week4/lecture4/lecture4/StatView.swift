//
//  StatView.swift
//  lecture4
//
//  Created by Fettah KIRAN on 9/11/24.
//

import SwiftUI

struct StatView: View {
    
    @Binding var totalSameCards: Int
    @Binding var totalDiffCards: Int
    
    var body: some View {
        VStack {
            Text("Same Cards: \(totalSameCards)")
                .font(.largeTitle)
                .padding()
            Text("Different Cards: \(totalDiffCards)")
                .font(.largeTitle)
                .padding()
        }
        .tabItem {
            Image(systemName: "list.dash")
            Text("Stats")
        }
    }
}

#Preview {
    StatView(totalSameCards: .constant(1), totalDiffCards: .constant(3))
}
