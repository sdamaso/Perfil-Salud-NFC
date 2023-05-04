//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct NFCView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @StateObject var nfcViewModel: NFCViewModel = NFCViewModel()
    @State private var showInfo = false
    @State private var selectProfiles = false
    @State private var profileEncontrados = false
    @State var selection = Set<ProfileModel.ID>()
    @State var perfilesGuardados: [String] = []
    @State var idNFC = ""
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
                        guard let userUID = Auth.auth().currentUser?.uid else {return}
                        if idNFC != ""{
                            if selection.isEmpty{
                                selectProfiles.toggle()
                            }
                            else{
                                selection.forEach({ id in
                                    perfilesGuardados.append(String(id!))
                                })
                                let newNFC = NFCModel(nfcUID: idNFC, userUID: userUID, perfiles: perfilesGuardados)
                                
                                nfcViewModel.createNewNFC(nfcID: idNFC,nfc: newNFC)
                                
                                selection.removeAll()
                                perfilesGuardados.removeAll()
                                selectProfiles.toggle()
                            }
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
                        idNFC = nfc.UID ?? ""
                        selectProfiles.toggle()
                        selection.removeAll()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 25))
                        Text("Guardar perfiles")
                    }
                    .padding()
                    
                    Button {
                        if nfc.UID != nil{
                            profileEncontrados.toggle()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                        Text("Escanear tarjeta NFC")
                    }
                    
                    Button {
                        nfc.scanNFC()
                    } label: {
                        HStack{
                            Image(systemName: "link.circle.fill")
                                .font(.system(size: 25))
                                .foregroundColor(Color.blue)
                            Text("Enlazar tarjeta NFC")
                                .foregroundColor(Color.blue)
                        }
                        .padding()
                        .background(Color("Color Logo"))
                        .cornerRadius(25)
                    }
                    .padding(.top, 130)
                }
                Spacer()
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
                        ForEach (nfcViewModel.userProfiles) { profile in
                            if nfcViewModel.savedProfiles.contains(profile.id!){
                                NavigationLink{
                                    ProfileDetailsView(profile: profile)
                                        .navigationBarTitleDisplayMode(.inline)                                   
                                }label: {
                                    ProfileEntry(profile: profile)
                                }
                            }
                        }
                    }
                    .task {
                        nfcViewModel.getNFCProfiles(nfcUid: nfc.UID!)
                    }
                    .toolbar{
                        ToolbarItem (placement: .navigationBarLeading){
                            Button{
                                profileEncontrados.toggle()
                            } label: {
                                Text("Cerrar")
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
