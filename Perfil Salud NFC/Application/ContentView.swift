//
//  ContentView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        
        TabView {
            ProfileView(profileViewModel: profileViewModel)
            
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Perfil")
                        
                }
                                
            NFCView()
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenStateManager())
            .previewDevice("iPhone 11")
    }
}
