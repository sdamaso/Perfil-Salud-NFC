//
//  ProfileEntry.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct ProfileEntry: View {
    var profile: ProfileModel
    
    var body: some View {
        HStack{
            CircleImage(profile: profile,size: 75)
                
            Text(profile.nombre)
                .font(.title2)
                .padding()
            
            Spacer()
            if profile.isFavorited {
                Image(systemName: "star.fill")
                    .padding()
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct ProfileEntry_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntry(profile: ProfileModel(nombre: "Samuel Damaso",nfc: nil, isFavorited: true, image: nil))
            .previewDevice("iPhone 11")
    }
}
