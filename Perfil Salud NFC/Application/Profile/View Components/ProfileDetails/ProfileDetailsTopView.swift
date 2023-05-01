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
                
                //FUNCION PARA PONER CONTACTO PRINCIPAL
                Button{
                    //TODO: Actualizar contacto favorito
                    //                            favorite.toggle()
                }label:{
                    if (profile.isFavorited ?? false){
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
}

struct ProdileDetailsTopView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsTopView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["polen", "ácaros"], medicacion: ["Pastillas alergia", "paracetamol"], enfermedades: ["ninguna"], tratamientos: ["ninguno"], antecedentes: ["cancer"], vacunas: ["covid-19"], donanteOrg: true, cirugiasPrev: ["ninguna"], implantes: ["ninguno"], embarazos: nil, partos: nil, contactos: ["mama": "60612341234", "papa": "908420934"]))
    }
}
