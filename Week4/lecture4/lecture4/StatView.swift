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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Same Cards: \(totalSameCards)")
                .font(.largeTitle)
                .padding()
            Text("Different Cards: \(totalDiffCards)")
                .font(.largeTitle)
                .padding()
            
//            if totalDiffCards != 0 {
                Button(action: {
                    totalSameCards = 0
                    totalDiffCards = 0
//                    dismiss()
                    
                }, label: {
                    Text("Restart")
                        .font(.title2)
                        .frame(minWidth: 150,minHeight: 10)
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
            })
//            }
            
            
            
            
            
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
