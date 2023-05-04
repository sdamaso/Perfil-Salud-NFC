//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct NFCView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @StateObject var nfcViewModel: NFCViewModel = NFCViewModel()
    @State private var showInfo = false
    @State private var selectProfiles = false
    @State private var profileEncontrados = false
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
                            Task{
                                await nfc.scanNFC()
                            }
                            print(nfc.UID ?? "")
                            selection.forEach({ id in
                                print(id ?? "")
                            })
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
                        Task{
                            await nfc.scanNFC()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                        Text("Escanear tarjeta NFC")
                    }
                    
                    
                    Button {
//                        nfcViewModel.getNFCProfiles(nfcUid: nfc.UID!)
                        profileEncontrados.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                        Text("Escanear tarjeta NFC")
                    }
                    .padding(.top, 50)
                }
                Spacer()
            }
            
            .task {
                nfcViewModel.getNFCProfiles(nfcUid: nfc.UID ?? "04fa75a5100289")
            }
            .navigationTitle("Escaner de NFC")
            .sheet(isPresented: $showInfo){
                NFCInfoView()
            }
            .sheet(isPresented: $selectProfiles){
                selectProfile
                    .presentationDetents([.medium, .large])
            }
            .fullScreenCover(isPresented: $profileEncontrados){
                NavigationView{
                    List{
                        ForEach (nfcViewModel.perfiles) { profile in
                            
                            NavigationLink{
                                ProfileDetailsView(profile: profile)
                                    .navigationBarTitleDisplayMode(.inline)
                                    .toolbar{
                                        NavigationLink ("Editar"){
                                            ProfileEditingView(profileViewModel: profileViewModel, profile: profile)
                                        }
                                    }
                                
                            }label: {
                                ProfileEntry(profile: profile)
                            }
                        }
                    }
                    .task {
                        nfcViewModel.getNFCProfiles(nfcUid: nfc.UID ?? "04fa75a5100289")
                    }
                    .toolbar{
                        ToolbarItem (placement: .navigationBarLeading){
                            Button{
                                
                            } label: {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                            }
                        }
                        
                        
                    }
                    .navigationTitle("Perfiles NFC")
                }
                
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
