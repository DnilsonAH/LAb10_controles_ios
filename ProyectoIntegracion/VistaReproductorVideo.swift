//
//  VistaReproductorVideo.swift
//  ProyectoIntegracion
//
//  Created by Dnilson Achahuanco on 28/05/25.
//

import SwiftUI
import UIKit
import AVKit

struct VistaReproductorVideo: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> ViewControllerVideo {
        let controlador = ViewControllerVideo()
        controlador.urlVideo = url
        return controlador
    }

    func updateUIViewController(_ uiViewController: ViewControllerVideo, context: Context) {
    }
}
