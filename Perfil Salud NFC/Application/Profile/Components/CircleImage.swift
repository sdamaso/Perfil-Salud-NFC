//
//  CircleImage.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct CircleImage: View {
    var profile: ProfileModel
    var size: CGFloat
    
    var body: some View {
        if profile.image == nil {
            //TODO: Cambiar systemName por imagen estatica para poder ser escalabrle dependiendo de la vista en la que se esté mostrando
            Image("Profile Default")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .scaledToFit()
        } else{
            Image(profile.image!)
                .resizable(capInsets: EdgeInsets(),resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .scaledToFit()
        }
        
        
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(profile: ProfileModel(nombre: "", nfc: [], isFavorited: true,image: "S"), size:200)
            .previewDevice("iPhone 11")
    }
}
