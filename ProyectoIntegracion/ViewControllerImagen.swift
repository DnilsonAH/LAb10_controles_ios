//
//  ViewControllerImagen.swift
//  ProyectoIntegracion
//
//  Created by Dnilson Achahuanco on 28/05/25.
//

import UIKit

class ViewControllerImagen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagenSeleccionada: ((UIImage) -> Void)?

    private func mostrarSelectorImagen() {
        let selector = UIImagePickerController()
        selector.sourceType = .photoLibrary
        selector.delegate = self
        present(selector, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarSelectorImagen()
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagenSeleccionada?(image)
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
