//
//  NFCViewModel.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 3/5/23.
//

import Foundation

final class NFCViewModel: ObservableObject{
    @Published var perfiles: [ProfileModel] = []
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
                self?.perfiles = profileModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    
}
