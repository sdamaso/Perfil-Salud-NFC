//
//  ProfileEntry.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct ProfileEntry: View {
    var body: some View {
        HStack{
            CircleImage()
                .frame(width: 100)
            Text("Samuel Dámaso de Miguel")
                .font(.title2)
            Spacer()
        }
    }
}

struct ProfileEntry_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEntry()
    }
}
