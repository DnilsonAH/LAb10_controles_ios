import SwiftUI

struct ContentView: View {
    @State private var imagenSeleccionada: UIImage?
    @State private var mostrarGaleria = false
    @State private var mostrarVideo = false

    var body: some View {
        NavigationView {
                VStack(spacing: 30) {
                Text("Lab 10")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)
                if let imagen = imagenSeleccionada {
                    Image(uiImage: imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 200)
                        .overlay(Text("Imagen no seleccionada").foregroundColor(.gray))
                }
                Button(action: {
                    mostrarGaleria = true
                }) {
                    Text("Seleccionar Imagen")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                Button(action: {
                    mostrarVideo = true
                }) {
                    Text("Reproducir Video")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                Text("Dnilson Achahuanco Huarilloclla")
                    .padding(.top, 30)

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $mostrarGaleria) {
            VistaSelectorImagen(imagenSeleccionada: $imagenSeleccionada, mostrar: $mostrarGaleria)
        }
        .fullScreenCover(isPresented: $mostrarVideo) {
            VistaReproductorVideo(url: URL(string: "https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.mp4")!)
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
