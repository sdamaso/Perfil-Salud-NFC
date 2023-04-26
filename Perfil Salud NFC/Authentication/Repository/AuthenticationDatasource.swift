//
//  AuthenticationDatasource.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 26/4/23.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}


final class AuthenticationDatasource{
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else{
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print ("Error creando un nuevo usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = result?.user.email ?? "No email"
            print("Nuevo usuario creado con el email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print ("Error haciendo login de un usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = result?.user.email ?? "No email"
            print("Usuario hizo login con el email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logout() throws{
        try Auth.auth().signOut()
    }
    
}
