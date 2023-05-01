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
         
            if profile.contactos != nil{
                ForEach( (profile.contactos?.sorted(by: >))!, id: \.key){ key, value in
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

struct ProfileDetailsContactView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsContactView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["polen", "ácaros"], medicacion: ["Pastillas alergia", "paracetamol"], enfermedades: ["ninguna"], tratamientos: ["ninguno"], antecedentes: ["cancer"], vacunas: ["covid-19"], donanteOrg: true, cirugiasPrev: ["ninguna"], implantes: ["ninguno"], embarazos: nil, partos: nil, contactos: ["mama": "60612341234", "papa": "908420934"]))
    }
}
