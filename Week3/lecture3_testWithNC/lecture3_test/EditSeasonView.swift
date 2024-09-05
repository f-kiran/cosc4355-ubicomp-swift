//
//  EditSeasonView.swift
//  lecture3
//
//  Created by Fettah KIRAN on 9/4/24.
//

import SwiftUI

struct EditSeasonView: View {
    
    @Binding var seasonName: String
    @State private var showEmptyAlert = false
    
    
    
    var onSave: () -> Void
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                       label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {
                    
                    if seasonName.isEmpty {
                        showEmptyAlert = true
                    } else {
                        onSave()
                        presentationMode.wrappedValue.dismiss()
                    }
                    

                    
                },
                       label: {
                    Text("Done")
                }).alert(isPresented: $showEmptyAlert){
                    Alert(title: Text("Opps!"),
                          message: Text("type something!"),
                          dismissButton: .default(Text("Okay")))
                    
                }
                
                
            }.padding()
            
            
            Text("Update Season")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            TextField("Edit Season", text: $seasonName)
                .padding()
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
            
            Spacer()
            
        }
        
    }
}

#Preview {
    EditSeasonView(seasonName: .constant("Test"), onSave: {
        print("Save clicked")
    })
}
