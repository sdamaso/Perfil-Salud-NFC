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
                if profile.telefono != nil{
                    Text("Teléfono")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.telefono ?? "")
                        .padding(.top, 1)
                }
                
                if profile.direccion != nil{
                    Text("Dirección")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.direccion ?? "")
                        .padding(.top, 1)
                }
                
                if profile.edad != nil{
                    Text("Edad")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.edad ?? "")
                        .padding(.top, 1)
                }
            }
            
        }
    }
}

struct ProfileDetailsPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsPersonalView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["polen", "ácaros"], medicacion: ["Pastillas alergia", "paracetamol"], enfermedades: ["ninguna"], tratamientos: ["ninguno"], antecedentes: ["cancer"], vacunas: ["covid-19"], donanteOrg: true, cirugiasPrev: ["ninguna"], implantes: ["ninguno"], embarazos: nil, partos: nil, contactos: ["mama": "60612341234", "papa": "908420934"]))
    }
}
