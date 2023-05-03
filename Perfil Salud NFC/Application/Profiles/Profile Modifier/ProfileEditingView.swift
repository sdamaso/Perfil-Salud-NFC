//
//  ProfileEditingView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 2/5/23.
//

import SwiftUI

struct ProfileEditingView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @State var profile: ProfileModel
    
    @State var n1 = ""
    @State var n2 = ""
    @State var n3 = ""
    @State var t1 = ""
    @State var t2 = ""
    @State var t3 = ""
    
    @State private var changeImage = false
    
    var body: some View {
        NavigationView {
            VStack{
                Button {
                    changeImage.toggle()
                }label: {
                    ZStack {
                        CircleImage(profile: profile, size: 100)
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.gray)
                            .offset(x: 45,y:40)
                            .font(.system(size: 25))
                    }
                }
                Form{
                    Section("Datos Personales") {
                        VStack(alignment: .leading){
                            Text("Nombre")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Nombre y apellidos", text: $profile.nombre)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Edad")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Edad", text: $profile.edad)
                        }
                        VStack(alignment: .leading) {
                            Text("Teléfono")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Teléfono", text: $profile.telefono)
                                .keyboardType(.numberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("Dirección")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Dirección", text: $profile.direccion)
                        }
                    }
                    Section("Datos médicos"){
                        VStack (alignment: .leading){
                            Text("Peso")
                                .foregroundColor(Color("Color Logo"))
                            HStack {
                                TextField("Peso", text: $profile.peso)
                                    .keyboardType(.decimalPad)
                                if profile.peso != ""{
                                    Text("kg")
                                }
                            }
                        }
                        VStack (alignment: .leading){
                            Text("Estatura")
                                .foregroundColor(Color("Color Logo"))
                            HStack{
                                TextField("Estatura", text: $profile.estatura)
                                    .keyboardType(.decimalPad)
                                if profile.estatura != ""{
                                    Text("metros")
                                }
                                Spacer()
                            }
                        }
                        Picker(selection: $profile.sexo) {
                            Text("Hombre").tag("Hombre")
                            Text("Mujer").tag("Mujer")
                            Text("Prefiero no decirlo").tag("Prefiero no decirlo")
                        } label: {
                            Text("Sexo")
                                .foregroundColor(Color("Color Logo"))
                        }
                        Picker(selection: $profile.grupoAndRh) {
                            Text("A+").tag("A+")
                            Text("A-").tag("A-")
                            Text("B+").tag("B+")
                            Text("B-").tag("B-")
                            Text("AB+").tag("AB+")
                            Text("AB-").tag("AB-")
                            Text("O+").tag("O+")
                            Text("O-").tag("O-")
                        } label: {
                            Text("Grupo Sanguíneo")
                                .foregroundColor(Color("Color Logo"))
                        }
                    }
                    Section("Afecciones medicas y reacciones") {
                        VStack(alignment: .leading) {
                            Text("Alergias")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Alergias", text: $profile.alergias)
                        }
                        VStack(alignment: .leading) {
                            Text("Medicación")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Medicación", text: $profile.medicacion)
                        }
                        VStack(alignment: .leading) {
                            Text("Enfermedades")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Enfermedades", text: $profile.enfermedades)
                        }
                        VStack(alignment: .leading) {
                            Text("Tratamientos en curso")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Tratamientos", text: $profile.tratamientos)
                        }
                        VStack(alignment: .leading) {
                            Text("Antecedentes familiares")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Antecedentes familiares", text: $profile.antecedentes)
                        }
                        Toggle("Donante de Órganos", isOn: $profile.donanteOrg)
                            .foregroundColor(Color("Color Logo"))
                        VStack(alignment: .leading) {
                            Text("Cirugías previas")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Cirugías previas", text: $profile.cirugiasPrev)
                        }
                        VStack(alignment: .leading) {
                            Text("Implantes y prótesis")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Implantes", text: $profile.implantes)
                        }
                    }
                    if profile.sexo == "Mujer"{
                        Section ("Maternidad"){
                            Stepper("Embarazos:              \(profile.embarazos)", value: $profile.embarazos as Binding<Int>, in: 0...20)
                                .foregroundColor(Color("Color Logo"))
                            Stepper("Partos:                      \(profile.partos)", value: $profile.partos as Binding<Int>, in: 0...20)
                                .foregroundColor(Color("Color Logo"))
                        }
                    }
                    Section("Contactos de emergencia (Escriba solo sobre los espacios que quiera modificar)"){
                            VStack (alignment: .leading){
                                HStack {
                                    Text("Nombre: ")
                                    TextField("Nombre", text: $n1)
                                }
                                HStack {
                                    Text("Teléfono: ")
                                    TextField("Teléfono", text: $t1)
                                        .keyboardType(.numberPad)
                                }
                            }
                        
                            VStack (alignment: .leading){
                                HStack {
                                    Text("Nombre: ")
                                    TextField("Nombre", text: $n2)
                                }
                                HStack {
                                    Text("Teléfono: ")
                                    TextField("Teléfono", text: $t2)
                                        .keyboardType(.numberPad)
                                }
                            }
                    
                            VStack (alignment: .leading){
                                HStack {
                                    Text("Nombre: ")
                                    TextField("Nombre", text: $n3)
                                }
                                HStack {
                                    Text("Teléfono: ")
                                    TextField("Teléfono", text: $t3)
                                        .keyboardType(.numberPad)
                                }
                            }
                    }
                }
            }
            .sheet(isPresented: $changeImage, content: {
                PhotoPicker(profile: $profile)
            })
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    Button {
                        profile.contactos = [:]
                        if n1 == ""{
                        } else if n2 == ""{
                            profile.contactos = [n1:t1]
                        } else if n3 == "" {
                            profile.contactos = [n1:t1,n2:t2]
                        } else {
                            profile.contactos = [n1:t1,n2:t2,n3:t3]
                        }
                        profileViewModel.update(profile: profile)
                    } label: {
                        Text("Guardar")
                            .foregroundColor(.green)
                    }
                }
            }
            
        }
        .navigationTitle(profile.nombre)
        
    }
}

extension Dictionary{
    subscript(i:Int) -> (key:Key, value:Value){
        get{
            return self[index(startIndex, offsetBy: i)];
        }
    }
}

struct ProfileEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingView(profileViewModel: ProfileViewModel(), profile: ProfileModel(id: nil, isFavorited: true, nombre: "Samuel Damaso", image: "Samuel Damaso", edad: "22 años", telefono: "606127186", direccion: "C/ Arroyo del Mojapán, 14", peso: "70", estatura: "1,80", sexo: "Masculino", grupoAndRh: "A+", alergias: "Polen, Ácaros", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "Cancer, Afasia", vacunas: "Covid-19", donanteOrg: true, cirugiasPrev: "", implantes: "", embarazos: 2, partos: 1, contactos: ["Mama": "60612341234", "Papa": "908420934"]))
    }
}
