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
                
                if profile.peso != nil{
                    Text("Peso")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.peso ?? "")
                        .padding(.top, 1)
                }
                
                if profile.estatura != nil{
                    Text("Estatura")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.estatura ?? "")
                        .padding(.top, 1)
                }
                
                if profile.sexo != nil{
                    Text("Sexo")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.sexo ?? "")
                        .padding(.top, 1)
                }
                
                if profile.grupoAndRh != nil{
                    Text("Grupo Sanguineo")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text(profile.grupoAndRh ?? "")
                        .padding(.top, 1)
                }
            }
            
            Group{
                if profile.alergias != nil{
                    Text("Alergias")
                        .padding(.top, 1)
                        .font(.footnote)
                    Text((profile.alergias ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
                
                if profile.medicacion != nil{
                    Text("Medicación")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text((profile.medicacion ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
                
                if profile.enfermedades != nil{
                    Text("Enfermedades")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text((profile.enfermedades ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
                
                if profile.tratamientos != nil{
                    Text("Tratamientos en curso")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text((profile.tratamientos ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
                
                if profile.antecedentes != nil{
                    Text("Antecedentes familiares")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text((profile.antecedentes ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
            }
            
            Group{
                if profile.vacunas != nil{
                    Text("Vacunas")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text((profile.vacunas ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
                
                if let donante = profile.donanteOrg{
                    if donante{
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
                }
                
                if profile.cirugiasPrev != nil{
                    Text("Cirugias previas")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text((profile.cirugiasPrev ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
    
                if profile.implantes != nil{
                    Text("Implantes")
                        .font(.footnote)
                        .padding(.top, 35)
                    Text((profile.implantes ?? []).joined(separator: ", \n"))
                        .padding(.top,1)
                }
            }
            
            Group{
                if profile.embarazos != nil{
                    Text("Embarazos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.embarazos ?? "")
                        .padding(.top, 1)
                }
                
                if profile.partos != nil{
                    Text("Partos")
                        .font(.footnote)
                        .padding(.top, 1)
                    Text(profile.partos ?? "")
                        .padding(.top, 1)
                }
            }
        }
    }
}


struct ProfileDetailsMedicalView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsMedicalView(profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: ["polen", "ácaros"], medicacion: ["Pastillas alergia", "paracetamol"], enfermedades: ["ninguna"], tratamientos: ["ninguno"], antecedentes: ["cancer"], vacunas: ["covid-19"], donanteOrg: true, cirugiasPrev: ["ninguna"], implantes: ["ninguno"], embarazos: nil, partos: nil, contactos: ["mama": "60612341234", "papa": "908420934"]))
    }
}
