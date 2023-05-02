//
//  ProfileCreationView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 2/5/23.
//

import SwiftUI

struct ProfileCreationView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var edad: Date = Date()
    @State var embarazos = 0
    @State var partos = 0
    
    @State var n1 = ""
    @State var n2 = ""
    @State var n3 = ""
    @State var n4 = ""
    @State var n5 = ""
    @State var t1 = ""
    @State var t2 = ""
    @State var t3 = ""
    @State var t4 = ""
    @State var t5 = ""
    @State var contactos = 0
    
    
    @State var profile: ProfileModel = ProfileModel(isFavorited: false, nombre: "", image: "", edad: "", telefono: "", direccion: "", peso: "", estatura: "", sexo: "Hombre", grupoAndRh: "A+", alergias: "", medicacion: "", enfermedades: "", tratamientos: "", antecedentes: "", vacunas: "", donanteOrg: false, cirugiasPrev: "", implantes: "", embarazos: "", partos: "", contactos: [:])
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                Rectangle()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(75)
                Form{
                    Section("Datos Personales") {
                        VStack(alignment: .leading){
                            Text("Nombre")
                                .foregroundColor(Color("Color Logo"))
                            TextField("Nombre y apellidos", text: $profile.nombre)
                        }
                        
                        DatePicker("Edad", selection: $edad, displayedComponents: .date)
                            .datePickerStyle(.automatic)
                            .foregroundColor(Color("Color Logo"))
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
                            Stepper("Embarazos:              \(embarazos)", value: $embarazos, in: 0...20)
                                .foregroundColor(Color("Color Logo"))
                            Stepper("Partos:                      \(partos)", value: $partos, in: 0...20)
                                .foregroundColor(Color("Color Logo"))
                        }
                    }
                    Section("Contactos de emergencia"){
                        if (contactos > 0) {
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
                        }
                        
                        if (contactos > 1) {
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
                        }
                        
                        if (contactos > 2) {
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
        
                        if contactos < 3{
                            Button{
                                contactos = contactos + 1
                                print(contactos)
                            }label: {
                                HStack{
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                    Text("Añadir un contacto")
                                        .foregroundColor(Color("Color Logo"))
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        let calendar = Calendar.current
                        let components = calendar.dateComponents([.year], from: edad, to: Date())
                        if n1 == ""{
                        } else if n2 == ""{
                            profile.contactos = [n1:t1]
                        } else if n3 == "" {
                            profile.contactos = [n1:t1,n2:t2]
                        } else {
                            profile.contactos = [n1:t1,n2:t2,n3:t3]
                        }
                        profile.edad = String(components.year!)
                        profile.embarazos = String(embarazos)
                        profile.partos = String(partos)
                        profileViewModel.createNewProfile(profile: profile)
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
            
        }
        
    }
}

struct ProfileCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreationView(profileViewModel: ProfileViewModel())
    }
}
