//
//  ProfileRepository.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 20/3/23.
//

import Foundation

final class ProfileRepository{
    private let profileDatasource: ProfileDatasource
    
    init(profileDatasource: ProfileDatasource = ProfileDatasource()) {
        self.profileDatasource = profileDatasource
    }
    
    func getAllProfiles (completionBlock: @escaping (Result<[ProfileModel], Error>) -> Void){ //PASO MI AUTHVM PARA VER TODOS LOS PROFILES DEL USUARIO
        profileDatasource.getAllProfiles(completionBlock: completionBlock)
    }
}
