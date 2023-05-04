//
//  ProfileView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct ProfileDetailsView: View {
    var profile: ProfileModel
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                    ProfileDetailsTopView(profile: profile)
                    
                    ProfileDetailsPersonalView(profile: profile)
                    
                    ProfileDetailsMedicalView(profile: profile)
                    
                    ProfileDetailsContactView(profile: profile)
                    
                }
            }
        .padding([.leading, .trailing, .bottom])
    }
}



struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView(profile: ProfileModel(id: nil, isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Prefiero no decirlo", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: 0, partos: 0, contactos: [:]))
            .previewDevice("iPhone 11")
    }
}

