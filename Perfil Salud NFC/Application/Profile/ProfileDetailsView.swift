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
        ProfileDetailsView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["Polen", "Ácaros"], medicacion: nil, enfermedades: nil, tratamientos: nil, antecedentes: ["Cancer, Afasia"], vacunas: ["Covid-19"], donanteOrg: true, cirugiasPrev: nil, implantes: nil, embarazos: nil, partos: nil, contactos: ["Mama": "60612341234", "Papa": "908420934"]))
            .previewDevice("iPhone 11")
    }
}

