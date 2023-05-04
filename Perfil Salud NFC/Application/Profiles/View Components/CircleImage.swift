//
//  CircleImage.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    var profile: ProfileModel
    var size: CGFloat
    
    var body: some View {
        if profile.image.elementsEqual("") {
            Image("Profile Default")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .scaledToFit()
        } else {
            WebImage(url: URL(string: profile.image))
                .resizable(capInsets: EdgeInsets(),resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .scaledToFit()
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(profile: ProfileModel(id: nil, isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Prefiero no decirlo", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: [:]), size:200)
        
        
            .previewDevice("iPhone 11")
    }
}
