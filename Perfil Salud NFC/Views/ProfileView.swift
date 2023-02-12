//
//  ProfileView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI

struct ProfileView: View {
    @State var username=""
    var body: some View {
        
        VStack{
            Text("Samuel")
                .font(.title)
            TextField(
                "User name (email address)",
                text: $username
            )
            .textInputAutocapitalization(.sentences)
            .disableAutocorrection(true)
            .border(.orange)
            Text("Nombre y Apellidos")
            
            
        }
        .navigationTitle("Perfil")
        
        .padding()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

