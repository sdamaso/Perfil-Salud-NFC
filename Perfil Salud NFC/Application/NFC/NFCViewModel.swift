//
//  NFCViewModel.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 3/5/23.
//

import Foundation

final class NFCViewModel: ObservableObject{
    @Published var userProfiles: [ProfileModel] = []
    @Published var savedProfiles: [String] = []
    @Published var messageError: String?
    private let nfcRepository: NFCRepository
    
    init(nfcRepository: NFCRepository = NFCRepository()){
        self.nfcRepository = nfcRepository
    }
    
    func getNFCProfiles (nfcUid: String){
        nfcRepository.getNFCProfiles(nfcUid: nfcUid) { [weak self] result in
            switch result{
            case.success(let profileModels):
                print("VM: \(profileModels.count)")
                self?.userProfiles = profileModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
        
        nfcRepository.getNFCModel(nfcUid: nfcUid) { [weak self] result in
            switch result{
            case.success(let nfcModel):
                self?.savedProfiles = nfcModel.perfiles
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func createNewNFC (nfcID: String, nfc: NFCModel){
        nfcRepository.createNewNFC(nfcID: nfcID, nfc: nfc) { [weak self] result in
            switch result{
            case .success(let nfc):
                print("Se subió correctamente el NFC: \(nfc.nfcUID ?? "ERROR")")
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
}
