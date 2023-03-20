//
//  CircleImage.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 14/2/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Samuel Damaso")
            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
            
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
            .previewDevice("iPhone 11")
    }
}
