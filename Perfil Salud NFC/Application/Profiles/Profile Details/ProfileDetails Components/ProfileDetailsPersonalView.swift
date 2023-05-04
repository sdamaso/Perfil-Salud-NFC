//
//  ProfileDetailsPersonalView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 1/5/23.
//

import SwiftUI

struct ProfileDetailsPersonalView: View {
    var profile: ProfileModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Datos personales")
                .font(.headline)
                .padding(.top)
            Divider()
                .padding(.bottom)
            
            Group{
                if profile.telefono != ""{
                    Text("Teléfono")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.telefono)
                        .padding(.top, 1)
                }
                
                if profile.direccion != ""{
                    Text("Dirección")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.direccion)
                        .padding(.top, 1)
                }
                
                if profile.edad != ""{
                    Text("Edad")
                        .font(.footnote)
                        .padding(.top, 1)
                    
                    HStack {
                        Text(profile.edad)
                            .padding(.top, 1)
                        Text("años")
                    }
                }
            }
        }
    }
}

struct ProfileDetailsPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsPersonalView(profile: ProfileModel(id: nil, isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Prefiero no decirlo", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: [:]))
    }
}
