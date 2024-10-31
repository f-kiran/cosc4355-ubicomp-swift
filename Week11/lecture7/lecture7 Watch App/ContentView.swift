//
//  ContentView.swift
//  lecture7 Watch App
//
//  Created by Fettah KIRAN on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModelWatch()
    
    var body: some View {
        VStack {
            Text(model.messageText)
                .foregroundColor(Color.red)
                .bold()
                .font(.custom("SF Pro Display", size: 20))
            Spacer()
            Image(uiImage: model.messageImg!)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
