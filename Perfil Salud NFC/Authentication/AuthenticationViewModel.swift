//
//  AuthenticationViewModel.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 26/4/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var error: String?
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func getCurrentUser() {
        self.user = authenticationRepository.getCurrentUser()
    }
    
    func createNewUser(email:String, password:String){
        authenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result{
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
    
    func login(email:String, password:String){
        authenticationRepository.login(email: email, password: password) { [weak self] result in
            switch result{
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
    
    func logout() {
        do{
            try authenticationRepository.logout()
            self.user = nil
        } catch{
            print("Error logout")
        }
        
    }
}
