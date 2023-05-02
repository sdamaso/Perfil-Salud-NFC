//
//  ContentView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        
        TabView {
            ProfileView(authenticationViewModel: authenticationViewModel, profileViewModel: profileViewModel)
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Perfil")
                        
                }
                                
            NFCView(profileViewModel: profileViewModel)
                .tabItem{
                    Image(systemName: "wave.3.right.circle")
                    Text("Escanear")
                }
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(3))
            self.launchScreenState.dismiss()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authenticationViewModel: AuthenticationViewModel())
            .environmentObject(LaunchScreenStateManager())
            .previewDevice("iPhone 11")
    }
}
