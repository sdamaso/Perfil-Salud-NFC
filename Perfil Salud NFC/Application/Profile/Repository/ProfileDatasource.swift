//
//  ProfileDatasource.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 20/3/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth



struct ProfileModel: Decodable, Identifiable, Hashable{
    @DocumentID var id: String?
    let nombre: String
    let nfc: [String]?
    let isFavorited: Bool
    let image: String?
}


final class ProfileDatasource{
    
    private let database = Firestore.firestore()

    private let collection = "perfiles"
    
    func getAllProfiles(completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){//PASO MI AUTHVM PARA VER TODOS LOS PROFILES DEL USUARIO
        guard let uid = Auth.auth().currentUser?.uid else {return}
        database.collection("users").document(uid).collection(collection)
            .addSnapshotListener { query, error in
                if let error = error{
                    completionBlock(.failure(error))
                    return
                }
                guard let documents = query?.documents.compactMap ({ $0 }) else{
                    completionBlock(.success([]))
                    return
                }
                let profiles = documents.map { try? $0.data(as: ProfileModel.self)}
                    .compactMap { $0 }
                completionBlock(.success(profiles))
                        
            }
        
    }
}
