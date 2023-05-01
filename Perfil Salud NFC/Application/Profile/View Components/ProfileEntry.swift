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
            if profile.isFavorited ?? false{
                Image(systemName: "star.fill")
                    .padding()
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct ProfileEntry_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntry(profile: ProfileModel(isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Dámaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["polen", "ácaros"], medicacion: ["Pastillas alergia", "paracetamol"], enfermedades: ["ninguna"], tratamientos: ["ninguno"], antecedentes: ["cancer"], vacunas: ["covid-19"], donanteOrg: true, cirugiasPrev: ["ninguna"], implantes: ["ninguno"], embarazos: nil, partos: nil, contactos: ["mama": "60612341234", "papa": "908420934"]))
            .previewDevice("iPhone 11")
    }
}
