//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct NFCView: View {
    @State private var showInfo = false
     var nfc = NFCController()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("La pantalla Escaner de NFC tiene dos funcionalidades, dependiendo de la necesidad del usuario.\n\nEl botón \(Image(systemName: "square.and.pencil")) Guardar perfiles permite almacenar en un tag NFC los perfiles de salud que seleccione.\n\nEl botón \(Image(systemName: "magnifyingglass")) Escanear NFC permite ver los perfiles almacenados dentro de una tarjeta.")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding([.bottom,.horizontal])
                    
                    Text("Para obtener más información pulse en el botón.")
                        .font(.caption)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    Button{
                        showInfo.toggle()
                    }
                label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 25))
                }
                .padding(.top, -10.0)
                }
                .padding(.top, -280.0)
                
                VStack {
                    Button {
                        nfc.scanNFC()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 25))
                        Text("Guardar perfiles")
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Button {
                        print("El UID extraido es: \(nfc.UID ?? "None")")
                    }
                label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25))
                    Text("Escanear tarjeta NFC")
                }
                }
            }
            .navigationTitle("Escaner de NFC")
            .sheet(isPresented: $showInfo){
                VStack{
                    HStack {
                        Image(systemName: "radiowaves.right")
                            .font(.system(size: 30))
                        Text("Información sobre el uso de NFC")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    Text("1. Guardar en la tarjeta NFC del usuario la información correspondiente a los perfiles que se seleccionen, para poder ser accedidos en cualquier momento mediante el escaneo de la correspondiente tarjeta NFC.")
                        .padding()
                    
                    
                    Text("2. Escanear la tarjeta NFC de un ususario con el fin de acceder a los perfiles médicos que se hayan guardado en el dispositivo.")
                        .padding()
                }
                .padding(.top, -350)
                .padding()
            }
        }
    }
}

func login (){
    print("Hola")
}

struct NFCView_Previews: PreviewProvider {
    static var previews: some View {
        NFCView()
    }
}
