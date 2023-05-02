//
//  ProfileDetailsMedicalView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 1/5/23.
//

import SwiftUI

struct ProfileDetailsMedicalView: View {
    var profile: ProfileModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            Group{
                Text("Datos médicos")
                    .font(.headline)
                    .padding(.top)
                Divider()
                
                if profile.peso != ""{
                    Text("Peso")
                        .font(.footnote)
                        .padding(.top, 1)
                    HStack {
                        Text(profile.peso)
                            .padding(.top, 1)
                        Text("kg")
                    }
                }
                
                if profile.estatura != ""{
                    Text("Estatura")
                        .font(.footnote)
                        .padding(.top, 1)
                    HStack {
                        Text(profile.estatura)
                            .padding(.top, 1)
                        Text("metros")
                    }
                }
                
                if profile.sexo != ""{
                    Text("Sexo")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.sexo)
                        .padding(.top, 1)
                }
                
                if profile.grupoAndRh != ""{
                    Text("Grupo Sanguineo")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text(profile.grupoAndRh)
                        .padding(.top, 1)
                }
            }
            
            Group{
                if profile.alergias != ""{
                    Text("Alergias")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.alergias)
                        .padding(.top,1)
                }
                
                if profile.medicacion != ""{
                    Text("Medicación")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.medicacion)
                        .padding(.top,1)
                }
                
                if profile.enfermedades != ""{
                    Text("Enfermedades")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text(profile.enfermedades)
                        .padding(.top,1)
                }
                
                if profile.tratamientos != ""{
                    Text("Tratamientos en curso")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.tratamientos)
                        .padding(.top,1)
                }
                
                if profile.antecedentes != ""{
                    Text("Antecedentes familiares")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.antecedentes)
                        .padding(.top,1)
                }
            }
            
            Group{
                if profile.vacunas != ""{
                    Text("Vacunas")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text(profile.vacunas)
                        .padding(.top,1)
                }
                
                
                if profile.donanteOrg{
                    Text("Donante de órganos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text("Sí")
                        .padding(.top, 1)
                } else{
                    Text("Donante de órganos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text("No")
                        .padding(.top, 1)
                }
                
                
                if profile.cirugiasPrev != ""{
                    Text("Cirugias previas")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.cirugiasPrev)
                        .padding(.top,1)
                }
                
                if profile.implantes != ""{
                    Text("Implantes")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text(profile.implantes)
                        .padding(.top,1)
                }
            }
            
            Group{
                if profile.embarazos != "0"{
                    Text("Embarazos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.embarazos)
                        .padding(.top, 1)
                }
                
                if profile.partos != "0"{
                    Text("Partos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.partos)
                        .padding(.top, 1)
                }
            }
        }
    }
}


struct ProfileDetailsMedicalView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsMedicalView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: "nil", partos: "nil", contactos: ["Mama": "60612341234", "Papa": "908420934"]))
    }
}
