//
//  VistaSelectorImagen.swift
//  ProyectoIntegracion
//
//  Created by Dnilson Achahuanco on 28/05/25.
//

import UIKit
import SwiftUI // Assuming this is for SwiftUI previews or related context

struct VistaSelectorImagen: UIViewControllerRepresentable {
    @Binding var imagenSeleccionada: UIImage?
    @Binding var mostrar: Bool

    class Coordinador: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: VistaSelectorImagen

        init(parent: VistaSelectorImagen) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.imagenSeleccionada = image
            }
            parent.mostrar = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.mostrar = false
        }
    }

    func makeCoordinator() -> Coordinador {
        return Coordinador(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
