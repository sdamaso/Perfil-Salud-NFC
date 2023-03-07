//
//  ProfileList.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/2/23.
//

import SwiftUI

struct ProfileList: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                    ProfileView()
                }label: {
                    ProfileEntry()
                }
            }
            .navigationTitle("Perfiles")
        }
        
    }
        
}


struct ProfileList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileList()
    }
}
