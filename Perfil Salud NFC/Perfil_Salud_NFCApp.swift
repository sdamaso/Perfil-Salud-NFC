//
//  Perfil_Salud_NFCApp.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct Perfil_Salud_NFCApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var launchScreenState = LaunchScreenStateManager()
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if let _ = authenticationViewModel.user{
                    HomeView(authenticationViewModel: authenticationViewModel)
                } else{
                    AuthenticationView(authenticationViewModel: authenticationViewModel)
                }
                
                if launchScreenState.state != .finished{
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
