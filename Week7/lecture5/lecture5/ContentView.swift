//
//  ContentView.swift
//  lecture5
//
//  Created by Fettah KIRAN on 10/2/24.
//

import SwiftUI

// colors
struct CustomColor {
    static let DarkBlue = Color("DarkBlue")
    static let LightBlue = Color("LightBlue")
    static let PinkBackground = Color("PinkBackground")
}


// store retrieved data
struct Response: Codable {
    var results: [Language]
}

struct ContentView: View {
    
    @State private var languages = [Language]()
    
    var body: some View {
        VStack {
            Text("Programming Languages").font(.title).bold()
            NavigationView {
//                List(1...10, id: \.self) {_ in
                List(languages, id: \.id) { Language in
                    HStack {
                        Section(header: Text("")) {
                            NavigationLink(destination: DetailView(about: Language.about, img_logo: Language.logo)) {
                                HStack {
                                    AsyncImage(url: Language.logo) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 80, maxHeight: 80)
                                            .clipShape(Circle())
                                        
                                    }
                                    placeholder: {
                                        ProgressView()
                                    }
                                    Spacer()
                                    VStack {
                                        Spacer()
                                        Text(Language.name)
                                            .font(.system(size: 25))
                                            .bold()
                                            .foregroundColor(.darkBlue)
                                        Spacer()
                                        
                                        Text("Est. " + String(Language.first_appeared))
                                            .font(.system(size: 12))
                                            .foregroundColor(.lightBlue)
                                        Spacer()
                                    }
                                    .multilineTextAlignment(.trailing)
                                    
                                }
                            }
                        }// header ends
                        
                        
                    }
               
                }
                .padding(5)
                .colorMultiply(.pinkBackground)
                    .task {
                        await loadData()
                    }
            }
        }
    }
    

    
    func loadData() async {
        
        guard let url = URL(string:"http://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/languages/languages_id.json"
        )
        else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonDecoder = JSONDecoder()
                    languages = try jsonDecoder.decode(Array<Language>.self, from: data)
                    
                } catch {
                    print("Error trying to decode JSON object")
                }

            } else if let error = error {
                print(error.localizedDescription)
            }
        }

        task.resume()
        
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
