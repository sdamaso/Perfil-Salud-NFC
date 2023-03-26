//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct NFCView: View {
    @State private var showInfo = false
    @State private var showProfiles = false
    var nfc = NFCController()
    
    
    var infoView: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack {
                    Image(systemName: "radiowaves.right")
                        .font(.system(size: 30))
                    
                    Text("Información sobre el uso de NFC")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                Text("La aplicación Perfil Salud permite crear un expediente sanitario donde se pueda contener toda la información medica del usuario en un mismo sitio almacenada y accesible en cualquier momento. Para que la portabilidad y accesibilidad a la aplicación y a sus datos sea aun mayor, mediante el uso de tags NFC se podrán guardar los perfiles elegidos por el usuario en su interior.\nDe esta manera, desde cualquier dispositivo que cuente con la aplicación Perfil Salud se tendrá acceso a los perfiles guardados en un tag NFC.\nEn este sentido la aplicación cuenta con dos botones con dos funcionalidade distintas. ")
                    .padding()
                
                Text("1. Guardar en la tarjeta NFC del usuario la información correspondiente a los perfiles que se seleccionen, para poder ser accedidos en cualquier momento mediante el escaneo de la correspondiente tarjeta NFC.")
                    .padding()
                
                
                Text("2. Escanear la tarjeta NFC de un ususario con el fin de acceder a los perfiles médicos que se hayan guardado en el dispositivo.")
                    .padding()
            }
            .padding(.top)
            .padding()
            .ignoresSafeArea()
        }
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
                        nfc.scanNFC()
                        showProfiles.toggle()
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 25))
                        Text("Guardar perfiles")
                    }
                    .padding()
                    
                    Button {
                        showProfiles.toggle()
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
                infoView
            }
            .sheet(isPresented: $showProfiles){
                
            }
            
        }
    }
    
    
    struct NFCView_Previews: PreviewProvider {
        static var previews: some View {
            NFCView()
                .previewDevice("iPhone 11")
        }
    }
}
