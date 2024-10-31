//
//  WatchConnector.swift
//  lecture7
//
//  Created by Fettah KIRAN on 10/30/24.
//
import Foundation
import WatchConnectivity

// This class manages the Watch connectivity session between the iOS and WatchOS apps.
class WatchConnector: NSObject, WCSessionDelegate {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        
        // Set the delegate and activate the session
        session.delegate = self
        session.activate()
    }
    
    // Called when the session activation completes, handles any errors in activation.
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("WCSession activation failed with error: \(error.localizedDescription)")
            return
        }
        print("WCSession activated with state: \(activationState)")
    }
    
    // Notifies when the session becomes inactive.
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("WCSession did become inactive")
    }
    
    // Notifies when the session deactivates and reactivates it if necessary.
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    
    // Function to send messages to the paired WatchOS app
    func sendMessage(_ message: [String: Any]) {
        guard session.isReachable else {
            print("WCSession is not reachable.")
            return
        }
        
        session.sendMessage(message, replyHandler: nil) { error in
            print("Failed to send message: \(error.localizedDescription)")
        }
    }
    
//    // Handles messages received from the WatchOS app.
//    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
//        if let messageText = message["message"] as? String {
//            print("Received message from watch: \(messageText)")
//        }
//    }
}
