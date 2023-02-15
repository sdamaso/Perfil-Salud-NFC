//
//  ProfileView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct ProfileView: View {
    @State var username=""
    var body: some View {
        
        VStack{
            
            VStack{
                CircleImage()
                    .frame(width: 150, height: 150)
                 
                HStack(alignment: .center){
                    Text("Samuel Dámaso de Miguel")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        
                    //FUNCION PARA PONER CONTACTO PRINCIPAL
                    Image(systemName: "star")
                }
                .padding(.top, -9.0)
            }
            
            
            Text("Descripción breve del usuario")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top, -9.0)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                    
                    VStack(alignment: .leading){
                        Text("Datos personales")
                            .font(.headline)
                            .padding(.top)
                        Divider()
                            .padding(.bottom)
                        
                        Text("Nombre y Apellidos")
                            .font(.footnote)
                        TextField(
                            "Nombre",
                            text: $username
                        )
                        .textInputAutocapitalization(.sentences)
                        TextField(
                            "Apellidos",
                            text: $username
                        )
                        
                        Spacer()
                            .frame(height: 20.0)
                        Text("Dirección")
                            .font(.footnote)
                        TextField(
                            "Nombre",
                            text: $username
                        )
                        .textInputAutocapitalization(.sentences)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Datos médicos")
                            .font(.headline)
                            .padding(.top)
                        Divider()
                            .padding(.bottom)
                        
                        Text("GRUPO SANGUINEO RH, ALERGIAS, ESTATURA, PESO, VACUNAS, ENFERMEDADES RESEÑABLES, MEDICACIÓN, CIRUJIAS PREVIAS, ANTECEDENTES MEDICOS FAMILIARES, DONANTE DE ORGANOS, SEXO, TRATAMIENTOS EN CURSO, CENTRO DE SALUD, MEDICO DE FAMILIA, ESPECIALISTAS, DATOS TARJETA SANITARIA, EDAD, (Implantes, marcapasos etc. Dentro de Cirujias previas sub grupos), (EN CASO DE MUJER, EMBARAZOS Y PARTOS)")
                            .font(.footnote)
                        TextField(
                            "Nombre",
                            text: $username
                        )
                        .textInputAutocapitalization(.sentences)
                        TextField(
                            "Apellidos",
                            text: $username
                        )
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("Contactos de emergencia")
                            .font(.headline)
                            .padding(.top)
                        Divider()
                            .padding(.bottom)
                        
                        Text("GRUPO SANGUINEO RH, ALERGIAS, ESTATURA, PESO, VACUNAS, ENFERMEDADES RESEÑABLES, MEDICACIÓN, CIRUJIAS PREVIAS, ANTECEDENTES MEDICOS FAMILIARES, DONANTE DE ORGANOS, SEXO, TRATAMIENTOS EN CURSO, CENTRO DE SALUD, MEDICO DE FAMILIA, ESPECIALISTAS, DATOS TARJETA SANITARIA, EDAD, (Implantes, marcapasos etc. Dentro de Cirujias previas sub grupos), (EN CASO DE MUJER, EMBARAZOS Y PARTOS)")
                            .font(.footnote)
                        TextField(
                            "Nombre",
                            text: $username
                        )
                        .textInputAutocapitalization(.sentences)
                        TextField(
                            "Apellidos",
                            text: $username
                        )
                        
                        Divider()
                            .frame(height: 65)
                            .opacity(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            
                            
                    }
                }
            }
            Spacer()
        }
        
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

/* TEXTFIELD PARA INSERTAR DATOS
 TextField(
 //                "User name (email address)",
 //                text: $username
 //            )
 //            .textInputAutocapitalization(.sentences)
 //            .disableAutocorrection(true)
 //            .border(.orange)
 */


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

