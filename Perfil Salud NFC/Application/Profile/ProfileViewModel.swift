//
//  ProfileViewModel.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 20/3/23.
//

import Foundation

final class ProfileViewModel: ObservableObject{
    @Published var profiles: [ProfileModel] = []
    @Published var messageError: String?
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository = ProfileRepository()) {
        self.profileRepository = profileRepository
    }
    
    func getAllProfiles(){ 
        profileRepository.getAllProfiles{ [weak self] result in
            switch result {
            case .success(let profileModels):
                self?.profiles = profileModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
}
