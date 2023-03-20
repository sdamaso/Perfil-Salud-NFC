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
            CircleImage()
                .frame(width: 100)
            Text(profile.nombre)
                .font(.title2)
            Spacer()
            if profile.isFavorited ?? false{
                Image(systemName: "star.fill")
                    .padding()
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct ProfileEntry_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntry(profile: ProfileModel(nombre: "Samuel Dámaso",nfc: nil, isFavorited: true))
            .previewDevice("iPhone 11")
    }
}
