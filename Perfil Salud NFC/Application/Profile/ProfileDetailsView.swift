//
//  ProfileView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct ProfileDetailsView: View {
    var profile: ProfileModel
    
    @State var username=""
//    @State var favorite = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                VStack{
                    CircleImage(profile: profile)
                        .frame(width: 150)
                    
                    HStack(alignment: .center){
                        Text(profile.nombre)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        
                        //FUNCION PARA PONER CONTACTO PRINCIPAL
                        Button{
                            //TODO: Actualizar contacto favorito
//                            favorite.toggle()
                        }label:{
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
                    }
                }
                
            }
            //  TOOLBAR PARA BOTON DE EDITAR, SI EL BOTON DE EDITAR SE PRESIONA SE CAMBIA POR LA VISTA DE CREACIÓN DE PERFIL, PERO CON LOS DATOS COMPLETADOS.
            
            .padding([.leading, .trailing, .bottom])
//            .ignoresSafeArea()
//            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
}


struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView(profile: ProfileModel(nombre: "Samuel", nfc: ["12","1o2i"], isFavorited: true, image: ""))
            .previewDevice("iPhone 11")
    }
}

