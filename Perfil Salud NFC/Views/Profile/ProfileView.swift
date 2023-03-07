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
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{
                
                VStack{
                    CircleImage()
                        .frame(width: 150)
                    
                    HStack(alignment: .center){
                        Text("Samuel Dámaso de Miguel")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        
                        //FUNCION PARA PONER CONTACTO PRINCIPAL
                        Image(systemName: "star")
                    }
                }
                
                Text("Descripción breve del usuario")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, -9.0)
                
                
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
                        .textInputAutocapitalization(.words)
                        TextField(
                            "Apellidos",
                            text: $username
                        )
                        .textInputAutocapitalization(.words)
                        
                        Spacer()
                            .frame(height: 20.0)
                        Text("Dirección")
                            .font(.footnote)
                        TextField(
                            "Domicilio",
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
                        Group{
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Grupo Sanguíneo")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Alergias")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Estatura")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Vacunas")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                        }
                        Group{
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Enfermedades")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Medicación")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Cirujías previas")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Antecedentes médicos familiares")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                        }
                        Group{
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Donante de órganos")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Sexo")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Tratamientos en curso")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Edad")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                        }
                        Group{
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Implantes")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Embarazos")
                                    .font(.footnote)
                                TextField(
                                    "Embarazos",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                            Group{
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Partos")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                                
                                Spacer()
                                    .frame(height: 20.0)
                                Text("Vacunas")
                                    .font(.footnote)
                                TextField(
                                    "Domicilio",
                                    text: $username
                                )
                                .textInputAutocapitalization(.sentences)
                            }
                        }
                        
                        
                        
                        
//                        Text(", ENFERMEDADES RESEÑABLES, MEDICACIÓN, CIRUJIAS PREVIAS, ANTECEDENTES MEDICOS FAMILIARES, DONANTE DE ORGANOS, SEXO, TRATAMIENTOS EN CURSO, CENTRO DE SALUD, MEDICO DE FAMILIA, ESPECIALISTAS, DATOS TARJETA SANITARIA, EDAD, (Implantes, marcapasos etc. Dentro de Cirujias previas sub grupos), (EN CASO DE MUJER, EMBARAZOS Y PARTOS)")
//                            .font(.footnote)
//                        TextField(
//                            "Nombre",
//                            text: $username
//                        )
//                        .textInputAutocapitalization(.sentences)
                        
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("Contactos de emergencia")
                            .font(.headline)
                            .padding(.top)
                        Divider()
                            .padding(.bottom)
                        
                        Text("LISTA CONTACTOS EMERGENCIA")
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
                        
//                        Divider()
//                            .frame(height: 65)
//                            .opacity(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding()
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.vertical)
            
        }
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
            .previewDevice("iPhone 11")
    }
}

