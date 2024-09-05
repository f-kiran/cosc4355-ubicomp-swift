//
//  SplashScreenView.swift
//  lecture2
//
//  Created by Fettah KIRAN on 8/28/24.
//
//

import Foundation


import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()
                Text("""
                     Hi, UbiComp F2024!
                     """
                ).font(.largeTitle)
                
                Image(systemName: "applelogo")
                    .resizable()
                    .frame(width: 200, height: 300)
                    .padding()
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
