//
//  ProfileEditingView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 2/5/23.
//

import SwiftUI

struct ProfileEditingView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    var profile: ProfileModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingView(profileViewModel: ProfileViewModel(), profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: "nil", partos: "nil", contactos: ["Mama": "60612341234", "Papa": "908420934"]))
    }
}
