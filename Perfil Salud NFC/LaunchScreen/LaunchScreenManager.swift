//
//  LaunchScreenManager.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 7/3/23.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
    @MainActor @Published private (set) var state: LaunchScreenStep = .start
    
    @MainActor func dismiss(){
        Task{
            state = .middle
            self.state = .finished
        }
    }   
}
