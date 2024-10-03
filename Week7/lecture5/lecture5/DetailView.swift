//
//  DetailView.swift
//  lecture5
//
//  Created by Fettah KIRAN on 10/2/24.
//

import SwiftUI


struct DetailView: View {
    var about: String
    var img_logo: URL
    
    var body: some View {
        VStack {
            Spacer()
            Text(about)
                .multilineTextAlignment(.center)
                .foregroundColor(CustomColor.LightBlue)
            Spacer()
            AsyncImage(url: img_logo) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 120, maxHeight: 120)
            } placeholder: {
                ProgressView()
            }
            Spacer()
        }
        .padding()
        .background(CustomColor.PinkBackground)
    }
}


#Preview {
    DetailView(about: "Hello Swift", img_logo: URL(string: "http://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/languages/swift.png")!)
}
