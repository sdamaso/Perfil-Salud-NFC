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
//            .rotationEffect(firstAnimation ? Angle(degrees: 900) : Angle(degrees: 1800))
//            .scaleEffect(secondAnimation ? 0 : 1)
//            .offset(y: secondAnimation ? 400 : 0)
    }
    
//    @ViewBuilder
//    private var backgroundColor: some View{
//        Color.white.ignoresSafeArea()
//    }
    
//    private let animationTimer = Timer
//        .publish(every: 0.5, on: .current, in: .common)
//        .autoconnect()
    
    @ViewBuilder
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            image
        }
//        .onReceive(animationTimer) { timerValue in
//            updateAnimation()
//        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
//    private func updateAnimation() {
//        switch launchScreenState.state {
//        case .start:
//            withAnimation(.easeInOut(duration: 0.9)) {
//                firstAnimation.toggle()
//            }
//        case .middle:
//            if !secondAnimation {
//                withAnimation(.linear) {
//                    self.secondAnimation = true
////                    startFadeoutAnimation = true
//                }
//            }
//        case .finished:
//            break
//        }
//    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
