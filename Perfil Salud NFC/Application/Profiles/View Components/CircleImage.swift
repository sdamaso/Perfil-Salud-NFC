//
//  CircleImage.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct CircleImage: View {
    var profile: ProfileModel
    var size: CGFloat
    
    var body: some View {
        if profile.image.elementsEqual("") {
            //TODO: Cambiar systemName por imagen estatica para poder ser escalabrle dependiendo de la vista en la que se esté mostrando
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
        } else{
            Image(profile.image)
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
        CircleImage(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: "nil", partos: "nil", contactos: ["Mama": "60612341234", "Papa": "908420934"]), size:200)
        
        
            .previewDevice("iPhone 11")
    }
}
