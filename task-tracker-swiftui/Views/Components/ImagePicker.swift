//
//  ImagePicker.swift
//  task-tracker-swiftui
//
//  Created by Nina Paripovic on 6/9/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            //obtaining saving path
            let fileManager = FileManager.default
            let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            let imagePath = documentsPath?.appendingPathComponent("image.jpg")

            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                try! uiImage.jpegData(compressionQuality: 0.0)?.write(to: imagePath!)
            }

            parent.presentationMode.wrappedValue.dismiss()
//            return imagePath
        }

        func saveImage(imageName: String, image: UIImage) {
         guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

            let fileName = imageName
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
            guard let data = image.jpegData(compressionQuality: 1) else { return }

            //Checks if file exists, removes it if so.
            if FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    try FileManager.default.removeItem(atPath: fileURL.path)
                    print("Removed old image")
                } catch let removeError {
                    print("couldn't remove file at path", removeError)
                }

            }

            do {
                try data.write(to: fileURL)
            } catch let error {
                print("error saving file with error", error)
            }

        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}
