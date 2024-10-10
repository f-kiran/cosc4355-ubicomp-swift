//
//  ContentView.swift
//  lecture6
//
//  Created by Fettah KIRAN on 10/9/24.
//3

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CompanyModelView()
    
    var body: some View {
        VStack {
            CompanyListView(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
