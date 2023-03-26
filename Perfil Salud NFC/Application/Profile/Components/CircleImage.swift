//
//  CircleImage.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct CircleImage: View {
    var profile: ProfileModel
    var body: some View {
        if profile.image == nil {
            //TODO: Cambiar systemName por imagen estatica para poder ser escalabrle dependiendo de la vista en la que se esté mostrando
            Image("Profile Default")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .scaledToFit()
            
            //            Image(systemName: "person.fill")
            //                .font(.system(size: 70))
            //                .foregroundColor(.gray)
            //                .clipShape(Circle())
            //                        .overlay {
            //                            Circle().stroke(.white, lineWidth: 4)
            //                        }
            //                        .shadow(radius: 7)
        } else{
            Image(profile.image!)
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
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
        CircleImage(profile: ProfileModel(nombre: "", nfc: [], isFavorited: true,image: nil))
            .previewDevice("iPhone 11")
    }
}
