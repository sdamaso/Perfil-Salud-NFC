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
    let isFavorited: Bool?
    //DATOS PERSONALES
    let nombre: String
    let image: String?
    let edad: String?
    let telefono: String?
    let direccion: String?
//    let nfc: [String]?
    //DATOS MÉDICOS
    let peso: String?
    let estatura: String?
    let sexo: String?
    let grupoAndRh: String?
    let alergias: [String]?
    let medicacion: [String]?
    let enfermedades: [String]?
    let tratamientos: [String]?
    let antecedentes: [String]?
    let vacunas: [String]?
    let donanteOrg: Bool?
    let cirugiasPrev: [String]?
    let implantes: [String]?
    let embarazos: String?
    let partos: String?
    //DATOS DE CONTACTOS DE EMERGENCIA
    let contactos: [String:String]?
}


final class ProfileDatasource{
    
    private let database = Firestore.firestore()

    private let collectionUser = "users"
    private let collectionProfile = "perfiles"
    
    func getAllProfiles(completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        database.collection(collectionUser).document(uid).collection(collectionProfile)
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
