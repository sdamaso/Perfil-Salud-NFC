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

struct ProfileModel: Decodable, Encodable, Identifiable, Hashable{
    @DocumentID var id: String?
    var isFavorited: Bool

    var nombre: String
    var image: String
    var edad: String
    var telefono: String
    var direccion: String

    var peso: String
    var estatura: String
    var sexo: String
    var grupoAndRh: String
    var alergias: String
    var medicacion: String
    var enfermedades: String
    var tratamientos: String
    var antecedentes: String
    var vacunas: String
    var donanteOrg: Bool
    var cirugiasPrev: String
    var implantes: String
    var embarazos: Int
    var partos: Int

    var contactos: [String:String]
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
    
    func createNewProfile (profile: ProfileModel, completionBlock: @escaping (Result<ProfileModel, Error>) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        do{
            _ = try database.collection(collectionUser).document(uid).collection(collectionProfile).addDocument(from: profile)
            completionBlock(.success(profile))
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    func update(profile: ProfileModel){
        guard let documentId = profile.id else {return}
        guard let uid = Auth.auth().currentUser?.uid else {return}
        do{
            _ = try database.collection(collectionUser).document(uid).collection(collectionProfile).document(documentId).setData(from: profile)
        } catch {
            print("Error actualizando el perfil")
        }
    }
    
    func delete (profile: ProfileModel){
        guard let documentId = profile.id else {return}
        guard let uid = Auth.auth().currentUser?.uid else {return}
        database.collection(collectionUser).document(uid).collection(collectionProfile).document(documentId).delete()
    }
    
}
