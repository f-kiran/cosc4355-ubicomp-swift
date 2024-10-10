//
//  MapView.swift
//  lecture6
//
//  Created by Fettah KIRAN on 10/9/24.
//

import SwiftUI
import MapKit

struct Annotation: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var coordinate: CLLocationCoordinate2D
    
    // Create an MKPointAnnotation from this custom Annotation object
    var pointAnnotation: MKPointAnnotation {
        let point = MKPointAnnotation()
        point.title = title
        point.subtitle = subtitle
        point.coordinate = coordinate
        return point
    }
}

struct DetailView: View {
    
    var company: Company
    
    @State private var region: MKCoordinateRegion
    @State private var annotations: [Annotation] = []
    
    // Initializer for DetailView that sets up the region using the company's HQ coordinates
    init(company: Company) {
        self.company = company
        _region = State(initialValue: MKCoordinateRegion(
            center: company.coordinate,
                //CLLocationCoordinate2D(latitude: company.hq_latitude, longitude: company.hq_longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }
    
    var body: some View {
        VStack(spacing: 20) {
//            Text("Company: \(company.company)")
//                .font(.largeTitle)
//                .padding()
//
//            Text("Headquarters Latitude: \(company.hq_latitude)")
//            Text("Headquarters Longitude: \(company.hq_longitude)")
            
            VStack {
                MapView(region: $region, annotations: $annotations)
                    .padding(.top, -15)
            }
            .onAppear {
                // When the view appears, reverse geocode to get more info about the location
                CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: company.hq_latitude, longitude: company.hq_longitude)) { placemarks, error in
                    // Ensure that geocoding succeeded and at least one placemark was found
                    guard let place = placemarks?.first, error == nil else {
                        return
                    }
                   // Create an annotation with the company's name and reverse-geocoded location info
                    let initialAnnotation = Annotation(
                        title: company.company,
                        subtitle: "\(place.locality ?? ""), \(place.administrativeArea ?? ""), \(place.isoCountryCode ?? "")",
//                        coordinate: CLLocationCoordinate2D(latitude: company.hq_latitude, longitude: company.hq_longitude)
                        coordinate: company.coordinate
                        
                    )
                    annotations.append(initialAnnotation)  // Add the annotation to the map
                }
            }
        }
        .navigationTitle(company.company)
        .padding()
    }
}
