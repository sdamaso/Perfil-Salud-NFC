//
//  NFCDatasource.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 3/5/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NFCModel: Decodable, Encodable, Hashable{
    @DocumentID var nfcUID: String?
    var userUID: String
    var perfiles: [String]
}

final class NFCDatasource{
    
    private let database = Firestore.firestore()
    
    private let collectionNFC = "nfc"
    
    func getNFCProfiles(nfcUid: String, completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){
        getNFCModel(nfcUid: nfcUid) { result in
            switch result{
            case .success(let nfc):
                print("obtenido \(nfc.userUID)")
                let uid = nfc.userUID
                self.database.collection("users").document(uid).collection("perfiles")
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
            case .failure(let error):
                print(error.localizedDescription)
                completionBlock(.failure(error))
                
                
            }
        }
    }
    

    func getNFCModel(nfcUid: String, completionBlock: @escaping (Result<NFCModel, Error>) -> Void){
        let docRef = database.collection(collectionNFC).document(nfcUid)
        docRef.getDocument(as: NFCModel.self) {result in
            switch result{
            case .success(let NFC):
                completionBlock(.success(NFC))
            case .failure(let error):
                print(error.localizedDescription)
                completionBlock(.failure(error))
            }
        }
    }
    
    func createNewNFC (nfcID: String, nfc: NFCModel, completionBlock: @escaping (Result<NFCModel,Error>) -> Void){
        do {
            _ = try database.collection(collectionNFC).document(nfcID).setData(from: nfc)
            completionBlock(.success(nfc))
        } catch {
            completionBlock(.failure(error))
        }
    }
}


//    func getNFCProfiles(nfcUid: String, completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){
////        var perfiles: [ProfileModel] = []
//        getNFCProfilesAUX(nfcUid: nfcUid) { result in
//            switch result{
//            case .success(let nfc):
//                print("obtenido \(nfc.userUID)")
//                let uid = nfc.userUID
//
//                self.database.collection("users").document(uid).collection("perfiles").whereField("id", arrayContainsAny: nfc.perfiles).addSnapshotListener { query, error in
//                    if let error = error{
//                        completionBlock(.failure(error))
//                        return
//                    }
//                    guard let documents = query?.documents.compactMap ({ $0 }) else{
//                        completionBlock(.success([]))
//                        return
//                    }
//                    let profiles = documents.map { try? $0.data(as: ProfileModel.self)}
//                        .compactMap { $0 }
//                    completionBlock(.success(profiles))
//                }
////                let perfilRef = self.database.collection("users").document(uid).collection("perfiles").whereField("id", arrayContainsAny: nfc.perfiles).add
////                perfilRef.getDocuments(completion: { query, err in
////                    <#code#>
////                })
////
//
////                (as: ProfileModel.self){ result in
////                    do{
////                        perfiles.append(try result.get())
////                    } catch{
////
////                    }
//
////                for perfil in nfc.perfiles{
////                    perfiles.append(self.getNFCProfilesAUX2(nfc: uid, perfil: perfil))
////                }
////                print("DS: \(perfiles.first?.nombre ?? "EROR")")
////                completionBlock(.success(perfiles))
//            case .failure(let error):
//                print(error.localizedDescription)
//                completionBlock(.failure(error))
//            }
//        }
//    }
//
//
//
////    func getNFCProfilesAUX2(nfc: String, perfil: String) -> ProfileModel {
////        let perArux: ProfileModel
////
////        let perfilRef = self.database.collection("users").document(nfc).collection("perfiles").whereField(perfil, arrayContainsAny: <#T##[Any]#>)
////        perfilRef.getDocument(as: ProfileModel.self){ result in
////              do {
////                let perArux = try result.get()
////              } catch {
////                // Handle error
////              }
////            }
////        return perArux
////        }
//
//

