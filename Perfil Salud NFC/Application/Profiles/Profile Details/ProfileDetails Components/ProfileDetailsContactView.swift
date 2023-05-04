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
        ProfileDetailsContactView(profile: ProfileModel(id: nil, isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Prefiero no decirlo", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: [:]))
    }
}
