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
        Image(systemName: "heart.text.square")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(Color(hue: 0.547, saturation: 0.223, brightness: 1.0))
    }
    
    @ViewBuilder
    private var backgroundColor: some View{
        let gradient = Gradient(colors: [Color.blue,
                                         Color.teal])
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            backgroundColor
            image
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
