//
//  NavigationView.swift
//  lecture3_test
//
//  Created by Fettah KIRAN on 9/5/24.
//

import SwiftUI

struct MyNavigationView: View {
    var seasons: [String]
    @Binding var seasonName: String
    var seasonIdx: Int
    
    var body: some View {
        
        HStack{
          
            NavigationView {
                
                ScrollView {
                    VStack (spacing:40){
                        ForEach(0..<3){ x in
                            NavigationLink(destination: {
                                SeasonDetailsView(detail: "\(seasons[seasonIdx])")
                            }, label: {
                                Text("Detail: \(x)")
                            })
                            .navigationTitle("\(seasons[seasonIdx])")
                            
                        }
                        
                        
                    }
                }
                
                
            }
            Spacer()
            
        }

        
    }
    
}


struct SeasonDetailsView : View {
    
    var detail: String
    init(detail: String) {
        self.detail = detail
        print("Init screen \(detail)")
    }
    
    var body: some View {
        
        Text("Details of index: \(detail)").padding(.trailing)
        
    }
}




#Preview {
    MyNavigationView(seasons: ["Summer"], seasonName: .constant("Test"), seasonIdx: 0)
}
