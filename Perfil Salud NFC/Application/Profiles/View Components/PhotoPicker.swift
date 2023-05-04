//
//  PhotoPicker.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 3/5/23.
//

import Foundation
import SwiftUI
import FirebaseStorage


struct PhotoPicker: UIViewControllerRepresentable{
    @Binding var profile: ProfileModel
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {  }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        let photoPicker: PhotoPicker

        init(photoPicker: PhotoPicker){
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                let fileName = UUID().uuidString
                let refStorage = Storage.storage().reference(withPath: fileName)
                guard let data = image.jpegData(compressionQuality: 0.1) else {return}
                refStorage.putData(data) { metadata, error in
                    if let error = error{
                        print("Error al subir la imagen a Storage: \(error.localizedDescription)")
                        return
                    }
                    refStorage.downloadURL { [self] url, error in
                        if let error = error{
                            print("Error al recibir la url de la imagen a Storage: \(error.localizedDescription)")
                            return
                        }
                        
                        print("Se ha guardado correctamente la imagen en Storage")
                        photoPicker.profile.image = url?.absoluteString ?? ""
                    }
                }
            } else { return }
            picker.dismiss(animated: true)
        }
    }
}
