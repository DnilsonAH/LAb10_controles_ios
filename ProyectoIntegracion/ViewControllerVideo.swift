import UIKit
import AVKit

class ViewControllerVideo: UIViewController {
    var urlVideo: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        reproducirVideo()
    }

    func reproducirVideo() {
        guard let url = urlVideo else { return }

        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player

        let botonCerrar = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(cerrarReproductor))
        playerController.navigationItem.rightBarButtonItem = botonCerrar

        let navController = UINavigationController(rootViewController: playerController)

        navController.navigationBar.isHidden = false

        DispatchQueue.main.async {
            self.present(navController, animated: true) {
                player.play()
            }
        }
    }

    @objc func cerrarReproductor() {
        self.dismiss(animated: true, completion: nil)
    }
}
