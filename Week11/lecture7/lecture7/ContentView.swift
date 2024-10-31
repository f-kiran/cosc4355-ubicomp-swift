//
//  ContentView.swift
//  lecture7
//
//  Created by Fettah KIRAN on 10/30/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation

import UIKit
import WatchConnectivity


extension UIImage {
//    This method resizes an image to a specified size.
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size)) // HW
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

struct ContentView: View {
    // Current displayed image (filtered or unfiltered)
    @State private var image: UIImage? = UIImage(named: "cs_uh")
    // The original image to reset back to
    @State private var originalImage: UIImage? = UIImage(named: "cs_uh")
    
    @State private var showImagePicker = false
    @State private var useCamera = false
    @State private var selectedFilterIndex = 0
    
    private let context = CIContext()
    private let filterNames = ["Original", "Chrome", "Fade"]
    
    var watchConnector = WatchConnector()
    var body: some View {
        VStack {
            
            Picker("Filter", selection: $selectedFilterIndex) {
                ForEach(0..<filterNames.count) { index in
                    Text(filterNames[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(minWidth: 200, maxWidth: 300, maxHeight: 250)
                //                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 300, height: 300)
            }
            
            
            
            HStack {
                Button(action: { self.showImagePicker = true; self.useCamera = true }) {
                    Image(systemName: "camera")
                }
                
                Button(action: { self.showImagePicker = true; self.useCamera = false }) {
                    Image(systemName: "photo.on.rectangle")
                }
                
                Button(action: sendToWatch) {
                    Image(systemName: "applewatch")
                }
                
                Button(action: savePhoto) {
                    Image(systemName: "square.and.arrow.down")
                }
            }
            .font(.system(size: 35))
            .padding()
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$image, originalImage: self.$originalImage, useCamera: self.useCamera)
            }
            .onChange(of: selectedFilterIndex) { newIndex in
                applyFilter()
            }
        }
        
    }
    
    // F1
    func applyFilter() {
        
        
        guard let baseImage = originalImage else { return }
        
        // Reset to original image if "Original" filter is selected
        if selectedFilterIndex == 0 {
            image = baseImage
            print("Image reset to original")
            return
        }
        
        
        guard let inputCIImage = CIImage(image: baseImage) else{ return }
        
        
//        https://developer.apple.com/documentation/coreimage/cifilter/color_effect_filters
        // Select the filter based on the selected index
        let filter: CIFilter
        
        if selectedFilterIndex == 1 {
            filter = CIFilter.photoEffectChrome()
        } else {
            filter = CIFilter.photoEffectFade()
        }
        
        // Set input image for the filter
        filter.setValue(inputCIImage, forKey: kCIInputImageKey)
        
        
        
        // Apply the filter and update the image if processing is successful
        if let outputImage = filter.outputImage,
           let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            image = UIImage(cgImage: cgimg)
        }
    }
    
    
    
    
    func sendToWatch() {
        let message = ["message": "Got at \(Date().formatted(.dateTime.hour().minute().second()))!"]
        print(message["message"] as Any)
        
        guard let resizedImage = image?.resizeImageTo(size: CGSize(width: 45.00, height: 45.00)),
              let imgData = resizedImage.pngData() else {
            print("Failed to resize or convert image to data.")
            return
        }
        
        if WCSession.default.isReachable {
            // Send the message first
            WCSession.default.sendMessage(message, replyHandler: nil) { error in
                print("Failed to send message to Watch: \(error.localizedDescription)")
            }
            
            // Send the image data separately
            WCSession.default.sendMessageData(imgData, replyHandler: nil) { error in
                print("Failed to send image data to Watch: \(error.localizedDescription)")
            }
        } else {
            print("Watch is not reachable.")
        }
        
    }
    
    //F2
    func savePhoto() {
        guard let selectedImage = image else { return }
        UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
    }
}



// F3 Image Picker to allow selecting new images and set the selected image as original
struct ImagePicker: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
                parent.originalImage = selectedImage // Update the new original image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Binding var image: UIImage?
    @Binding var originalImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var useCamera: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = useCamera ? .camera : .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


#Preview {
    ContentView()
}
