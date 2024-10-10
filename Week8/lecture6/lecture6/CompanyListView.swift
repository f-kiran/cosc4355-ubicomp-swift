//
//  CompanyListView.swift
//  lecture6
//
//  Created by Fettah KIRAN on 10/9/24.
//


import SwiftUI

struct CompanyRowView: View {
    var company: Company

    var body: some View {
        HStack {

            Text(company.company)
                .font(.title2)
            Spacer()
        }
        .frame(height: 70)
        .background(Color.color1)
        
    }
}


struct CompanyListView: View {
    
    @ObservedObject var viewModel: CompanyModelView

    var body: some View {
        
        VStack {
            
            // Test Navigation View
//            NavigationView {
//                List(1...12, id:\.self) {n in
//                    NavigationLink("Company " + String(n)){
//                        Text("Company Map")
//                            .font(.title2)
//                            .padding()
//                    }
//                
//                }.navigationTitle("Test Companies")
//                
//            }
            
            
            
            NavigationView {
                List {
                    ForEach(viewModel.companies) { company_row in
                        NavigationLink(destination: DetailView(company: company_row)) {
                            
                            CompanyRowView(company: company_row)
//                            Text(company_row.company) // Display company name in the list
                            //                            .frame(height: 70)
                            //                            .padding(.horizontal)
                        }
                    }
                    .onDelete(perform: viewModel.deleteCompany)
                }
                .toolbar {
                    EditButton() // Adds an edit button for deleting companies
                        .font(.title2).bold()
                }
                .navigationTitle("Tech Companies")
                .scrollContentBackground(.hidden)
//                .background(Color.orange)
                
                
            }
            
        
        }
        .padding(.bottom)
        
//        .background{
//            Image("background_img")
//                .resizable()
//                .scaledToFill()
//                .clipped()
//                .edgesIgnoringSafeArea(.all)
//                .blur(radius: 5)
//                .overlay(Color.indigo.opacity(0.1))
//        }
 
        
        
        
    }
    
}

struct CompanyListView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListView(viewModel: CompanyModelView())
    }
}
