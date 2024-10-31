//
//  ViewModelWatch.swift
//  lecture7 Watch App
//
//  Created by Fettah KIRAN on 10/30/24.
//

import SwiftUI
import Foundation
import WatchConnectivity // Import WatchConnectivity framework for communication between Apple Watch and iPhone


class ViewModelWatch: NSObject, WCSessionDelegate, ObservableObject{
    var session: WCSession
    
    @Published var messageText = "Waiting for the image" // Published property for message text
    @Published var messageImg = UIImage(systemName: "circle.fill")
    
    // initial prperties
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    // MARK: - WCSessionDelegate Methods
    
    // Delegate function
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    // Delegate function
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            print(message["message"] as Any)
            self.messageText = message["message"] as? String ?? "Unknown" // Update messageText property
        }
    }
    // Delegate function
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            self.messageImg = UIImage(data: messageData) // Update messageImg property with received image data
        }
    }
}


