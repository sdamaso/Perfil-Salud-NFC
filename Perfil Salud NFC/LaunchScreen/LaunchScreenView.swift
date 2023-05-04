//
//  LaunchScreenView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 7/3/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    @ViewBuilder
    private var image: some View{
        Image("Perfil Salud Icon V2.0")
            .resizable()
            .frame(width: 200, height: 200)
            .cornerRadius(25)
    }
    
    @ViewBuilder
    private var backgroundColor: some View{
        let gradient = Gradient(colors: [Color.black])
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                image
                Text("PERFIL SALUD")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Color Logo"))
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
            .previewDevice("iPhone 11")
    }
}
