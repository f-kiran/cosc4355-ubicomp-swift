//
//  EditSeasonView.swift
//  lecture3
//
//  Created by Fettah KIRAN on 9/4/24.
//
import SwiftUI

// This view allows users to edit the name of a season.
struct EditSeasonView: View {
    
    // Binding to the season name, allowing this view to update the value in the parent view.
    @Binding var seasonName: String
    @State private var showEmptyAlert = false
    
    // Closure to handle actions when the user taps the "Save" button.
    var onSave: () -> Void
    
    // Environment property to control the presentation mode of the view,
    // allowing the view to dismiss itself.
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            HStack {
                // Cancel Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                    
                }
                .padding(20)
                .foregroundColor(.blue)
                
                Spacer()
                Button(action: {
                    if seasonName.isEmpty{
                        showEmptyAlert = true
                    } else{
                        onSave()
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                {
                    Text("Done")
                        .padding(20)
                        .foregroundColor(.blue)
                }.alert(isPresented: $showEmptyAlert){
                    Alert(title: Text("Opps!"),
                          message: Text("New name cannot be empty!"),
                          dismissButton: .default(Text("Okay"))
                    )
                }
                
                
                
            }

            Text("Update Season Name")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .padding()
            
            
            TextField("Edit Season", text: $seasonName)
                .padding()
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()

        Spacer()
        }
        .padding() // Padding around the entire VStack
        
        
    }
}


#Preview {
    EditSeasonView(seasonName: .constant("Summer"),
        onSave: {
        print("Saved clicked")
    })
}


