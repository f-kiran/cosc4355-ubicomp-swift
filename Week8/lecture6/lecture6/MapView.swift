//
//  MapView.swift
//  lecture6
//
//  Created by Fettah KIRAN on 10/9/24.
//


import SwiftUI
import MapKit

// MapView conforms to UIViewRepresentable to integrate MKMapView in SwiftUI
struct MapView: UIViewRepresentable {
    // Binding to track and update the map's region and annotations
    @Binding var region: MKCoordinateRegion
    @Binding var annotations: [Annotation]
    
    // Creates and configures the MKMapView to be displayed in SwiftUI
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Long press gesture to drop a pin
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.longPressGesture(recognizer:)))
        longPress.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(longPress)
        
        return mapView
    }
    
//    updates the map whenever the region or annotations bindings change.
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations.map({ $0.pointAnnotation }))
    }
    
// Creates the coordinator to manage MKMapViewDelegate methods and handle interactions
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
//    The Coordinator class acts as the delegate for MKMapView.
//    It manages map interactions and responds to gesture recognizers.
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        var longPressPinCount = 0
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        @objc func longPressGesture(recognizer: UILongPressGestureRecognizer) {
            if recognizer.state == .began {
                let touchPoint = recognizer.location(in: recognizer.view)
                let longPressMapCoordinate = (recognizer.view as! MKMapView).convert(touchPoint, toCoordinateFrom: recognizer.view)
                
                longPressPinCount += 1
                let longPressAnnotation = Annotation(
                    title: "Pin #\(longPressPinCount)",
                    subtitle: "Planned to visit this place \(longPressPinCount)",
                    coordinate: longPressMapCoordinate
                )
                // Append the new annotation to the parent MapView's annotations array
                parent.annotations.append(longPressAnnotation)
            }
        }
    }
}

