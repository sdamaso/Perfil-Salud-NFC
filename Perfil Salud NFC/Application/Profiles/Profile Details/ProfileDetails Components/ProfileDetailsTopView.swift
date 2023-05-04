//
//  ProdileDetailsTopView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 1/5/23.
//

import SwiftUI

struct ProfileDetailsTopView: View {
    var profile: ProfileModel
    
    var body: some View {
        VStack{
            CircleImage(profile: profile, size: 125)
            
            HStack(alignment: .center){
                Text(profile.nombre)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                if (profile.isFavorited){
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else{
                    Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                }
                
            }
        }
    }
}

struct ProdileDetailsTopView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsTopView(profile: ProfileModel(id: nil, isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Prefiero no decirlo", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: [:]))
    }
}
