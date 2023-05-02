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
    
    func createNewProfile (profile: ProfileModel, completionBlock: @escaping (Result<ProfileModel, Error>) -> Void){
        profileDatasource.createNewProfile(profile: profile, completionBlock: completionBlock)
    }
    
    func update (profile: ProfileModel){
        profileDatasource.update(profile: profile)
    }
    
    func delete (profile: ProfileModel){
        profileDatasource.delete(profile: profile)
    }
}
