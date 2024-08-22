/*:
[Previous](@previous)
 
*A UIKit based Playground for presenting user interface*

*/
import UIKit
import PlaygroundSupport

// Define a custom view controller class inheriting from UIViewController
class MyViewController : UIViewController {
    // Override the loadView method to set up the view hierarchy
    override func loadView() {
        // Create a UIView instance and set its background color to white
        let view = UIView()
        view.backgroundColor = .orange


        // Create a UILabel instance and set its frame (position and size)
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 20)
        label.text = "Hello UbiComp F2024!" // Set the text to display in the label
        label.textColor = .blue // Set the text color to black
        
        // Add the label as a subview of the main view
        view.addSubview(label)
        self.view = view
    }
}

// Present the view controller in the Live View window (for Playground)
PlaygroundPage.current.liveView = MyViewController()


//: [Introduction](Introduction)
