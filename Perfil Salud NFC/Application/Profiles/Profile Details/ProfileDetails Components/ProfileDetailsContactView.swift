//
//  ProfileDetailsContactView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 2/5/23.
//

import SwiftUI

struct ProfileDetailsContactView: View {
    var profile:ProfileModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Contactos de emergencia")
                .font(.headline)
                .padding(.top)
            Divider()
                .padding(.bottom)
         
            if profile.contactos != [:]{
                ForEach( (profile.contactos.sorted(by: >)), id: \.key){ key, value in
                    if key != ""{
                        VStack (alignment: .leading){
                            Text(key)
                                .font(.footnote)
                                .padding(.top, 1)
                            Text(value)
                                .padding(.top, 1)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileDetailsContactView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsContactView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: ["Mama": "60612341234", "Papa": "908420934"]))
    }
}