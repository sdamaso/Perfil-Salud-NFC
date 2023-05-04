//
//  InfoView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/4/23.
//

import SwiftUI

struct NFCInfoView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack {
                    Image(systemName: "radiowaves.right")
                        .font(.system(size: 30))
                    
                    Text("Información sobre el uso de NFC")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                Text("La aplicación Perfil Salud permite crear un expediente sanitario donde se pueda contener toda la información medica del usuario en un mismo sitio almacenada y accesible en cualquier momento. Para que la portabilidad y accesibilidad a la aplicación y a sus datos sea aun mayor, mediante el uso de tags NFC se podrán guardar los perfiles elegidos por el usuario en su interior.\nDe esta manera, desde cualquier dispositivo que cuente con la aplicación Perfil Salud se tendrá acceso a los perfiles guardados en un tag NFC.\nEn este sentido la aplicación cuenta con dos botones con dos funcionalidades distintas. ")
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
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NFCInfoView()
    }
}
