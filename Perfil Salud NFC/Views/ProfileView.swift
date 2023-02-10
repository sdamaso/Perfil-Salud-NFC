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
            NavigationView {
                TextField(
                        "User name (email address)",
                        text: $username
                )
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .textInputAutocapitalization(.sentences)
                    .disableAutocorrection(true)
                    .border(.orange)
                
                
                
                .navigationTitle("Perfil")
                
                .toolbar{
                    EditButton()
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

