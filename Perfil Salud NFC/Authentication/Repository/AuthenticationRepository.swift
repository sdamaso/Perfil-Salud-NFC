//
//  AuthenticationRepository.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 26/4/23.
//

import Foundation

final class AuthenticationRepository{
    private let authenticationDatasource: AuthenticationDatasource
    
    init(authenticationDatasource: AuthenticationDatasource = AuthenticationDatasource()){
        self.authenticationDatasource = authenticationDatasource
    }
    
    func getCurrentUser() -> User? {
        authenticationDatasource.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        authenticationDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        authenticationDatasource.login(email: email, password: password, completionBlock: completionBlock)
    }
    
    func logout() throws{
        try authenticationDatasource.logout()
    }
}
