//
//  NFCReader.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct NFCReaderView: View {
    @State private var showInfo = false
    var body: some View {
        
        NavigationView {
            VStack {
                VStack{
                    Text("La función de la pantalla Escaner de NFC tiene dos funcionalidades, dependiendo de la necesidad del usuario.")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding([.leading, .bottom, .trailing])
                        
                    Button{
                        showInfo.toggle()
                    }
                    label: {
                        Label("", systemImage: "info.circle")
                            .font(.system(size: 25))
                    }
                    .padding(.top, -15.0)
                }
                .padding(.top, -310.0)
        
                Button (action: login){
                    Text("Leer tarjeta NFC")
                }
            }
            .navigationTitle("Escaner de NFC")
            .sheet(isPresented: $showInfo){
                VStack{
                    
                    Text("1. Guardar en la tarjeta NFC del usuario la información correspondiente a los perfiles que se seleccionen, para poder ser accedidos en cualquier momento mediante el escaneo de la correspondiente tarjeta NFC.")
                        .padding()
                    
                    
                    Text("2. Escanear la tarjeta NFC de un ususario con el fin de acceder a los perfiles médicos que se hayan guardado en el dispositivo.")
                        .padding()
                }
            }
            
            
        }
        
    }
}

func login (){
    print("Hola")
}

struct NFCReaderView_Previews: PreviewProvider {
    static var previews: some View {
        NFCReaderView()
    }
}
