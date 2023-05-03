//
//  ProfileEntry.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct ProfileEntry: View {
    var profile: ProfileModel
    
    var body: some View {
        HStack{
            CircleImage(profile: profile,size: 75)
                
            Text(profile.nombre)
                .font(.title2)
                .padding()
            
            Spacer()
            if profile.isFavorited{
                Image(systemName: "star.fill")
                    .padding()
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct ProfileEntry_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntry(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: ["Mama": "60612341234", "Papa": "908420934"]))
            .previewDevice("iPhone 11")
    }
}
