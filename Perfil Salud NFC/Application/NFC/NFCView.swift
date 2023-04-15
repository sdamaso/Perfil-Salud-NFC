//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct NFCView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @State private var showInfo = false
    @State private var selectProfiles = false
    @State var selection = Set<ProfileModel.ID>()
    var nfc = NFCController()

    
    var selectProfile: some View{
        NavigationView{
            List(selection: $selection){
                Section{
                    ForEach(profileViewModel.profiles) { profile in
                        HStack{
                            CircleImage(profile: profile,size: 60)
                            
                            Text(profile.nombre)
                                .font(.body)
                                .padding(.leading, 5)
                        }
                    }
                }header:{
                    Text("Seleccione los perfiles que desee guardar")
                }
            }
            .environment(\.editMode, .constant(EditMode.active))
            .listStyle(.plain)
            .task {
                profileViewModel.getAllProfiles()
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        if selection.isEmpty{
                            selectProfiles.toggle()
                        }
                        else{
                            nfc.scanNFC()
                            print(selection.count)
                            selection.removeAll()
                            selectProfiles.toggle()
                        }
                    } label:{
                        Text("Guardar")
                    }
                }
            }
        }
        .padding(.all)
        .ignoresSafeArea()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("La pantalla Escaner de NFC tiene dos funcionalidades, dependiendo de la necesidad del usuario.\n\nEl botón \(Image(systemName: "square.and.pencil")) Guardar perfiles permite almacenar en un tag NFC los perfiles de salud que seleccione.\n\nEl botón \(Image(systemName: "magnifyingglass")) Escanear NFC permite ver los perfiles almacenados dentro de una tarjeta.")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.all)
                    
                    Text("Para obtener más información pulse en el botón.")
                        .font(.caption)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    Button{
                        showInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 25))
                    }
                }
                
                VStack {
                    Button {
                        selectProfiles.toggle()
                        selection.removeAll()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 25))
                        Text("Guardar perfiles")
                    }
                    .padding()
                    
                    Button {
                        nfc.scanNFC()
//                        showProfiles.toggle()
                        print("El UID extraido es: \(nfc.UID ?? "None")")
                    }
                label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25))
                    Text("Escanear tarjeta NFC")
                }
                }
                Spacer()
            }
            .navigationTitle("Escaner de NFC")
            .sheet(isPresented: $showInfo){
                InfoView()
            }
            .sheet(isPresented: $selectProfiles){
                selectProfile
                    .presentationDetents([.medium, .large])
            }
            
        }
    }
    
    
    struct NFCView_Previews: PreviewProvider {
        static var previews: some View {
            NFCView(profileViewModel: ProfileViewModel())
                .previewDevice("iPhone 11")
        }
    }
}
