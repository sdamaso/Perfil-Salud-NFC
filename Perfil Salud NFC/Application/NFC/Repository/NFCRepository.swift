//
//  NFCRepository.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 3/5/23.
//

import Foundation

final class NFCRepository{
    private let nfcDatasource: NFCDatasource
    
    init(nfcDatasource: NFCDatasource = NFCDatasource()){
        self.nfcDatasource = nfcDatasource
    }
    
    func getNFCProfiles (nfcUid: String, completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){
        nfcDatasource.getNFCProfiles(nfcUid: nfcUid, completionBlock: completionBlock)
    }
    
    func getNFCModel (nfcUid: String, completionBlock: @escaping (Result<NFCModel, Error>) -> Void){
        nfcDatasource.getNFCModel(nfcUid: nfcUid, completionBlock: completionBlock)
    }
    
    func createNewNFC (nfcID: String, nfc: NFCModel, completionBlock: @escaping (Result<NFCModel, Error>) -> Void){
        nfcDatasource.createNewNFC(nfcID: nfcID, nfc: nfc, completionBlock: completionBlock)
    }
    
}
