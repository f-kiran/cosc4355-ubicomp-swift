//
//  CompanyViewModel.swift
//  lecture6
//
//  Created by Fettah KIRAN on 10/9/24.
//
// 1

import Foundation
import CoreLocation

// Struct representing a company with its name and headquarters' coordinates
// Conforms to Codable for JSON parsing and Identifiable for use in SwiftUI lists
struct Company: Codable, Identifiable {
    let id = UUID()
    var company: String
    var hq_longitude: Double
    var hq_latitude: Double
    // Computed property to return the company's location as a CLLocationCoordinate2D
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: hq_latitude, longitude: hq_longitude)
    }
    
    // Ignore `id` in Codable implementation, using the private
    private enum CodingKeys: String, CodingKey {
        case company, hq_longitude, hq_latitude
    }

}

// ViewModel for handling data fetching and business logic
// Uses @Published properties to notify SwiftUI views when data changes
class CompanyModelView: ObservableObject {
    @Published var companies: [Company] = [] // List of companies fetched from a remote server
    @Published var selectedCompany: Company? // Optional selected company, can be used to display details

    init() {
        downloadData()
    }

    func downloadData() {
        guard let url = URL(string: "http://m.cpl.uh.edu/courses/ubicomp/fall2021/webservice/companies_map.json") else { return }
        // Create a data task to fetch the data asynchronously
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let downloadedData = data {
                do {
                    // Decode the downloaded JSON data into an array of Company objects
                    let decodedCompanies = try JSONDecoder().decode([Company].self, from: downloadedData)
                    
                    // Dispatch the update to the main thread to avoid UI thread issues
                    DispatchQueue.main.async {
                        self.companies = decodedCompanies
                    }
                } catch {
                    print("Error in JSON decoding: \(error)")
                }
            }
        }.resume() // Start the data task
    }

    // Function to delete a company from the list
    func deleteCompany(at offsets: IndexSet) {
        companies.remove(atOffsets: offsets)
    }
}
