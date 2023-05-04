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
    
    func createNewProfile (profile: ProfileModel){
        profileRepository.createNewProfile(profile: profile) { [weak self] result in
            switch result {
            case .success(let profile):
                print("Se ha subido correctamente el nuevo perfil: \(profile.nombre)")
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func update(profile: ProfileModel){
        let updatedProfile = ProfileModel(id: profile.id ?? nil,
                                          isFavorited: profile.isFavorited,
                                          nombre: profile.nombre,
                                          image: profile.image,
                                          edad: profile.edad,
                                          telefono: profile.telefono,
                                          direccion: profile.direccion,
                                          peso: profile.peso,
                                          estatura: profile.estatura ,
                                          sexo: profile.sexo,
                                          grupoAndRh: profile.grupoAndRh,
                                          alergias: profile.alergias,
                                          medicacion: profile.medicacion,
                                          enfermedades: profile.enfermedades,
                                          tratamientos: profile.tratamientos,
                                          antecedentes: profile.antecedentes,
                                          vacunas: profile.vacunas,
                                          donanteOrg: profile.donanteOrg,
                                          cirugiasPrev: profile.cirugiasPrev,
                                          implantes: profile.implantes,
                                          embarazos: profile.embarazos,
                                          partos: profile.partos,
                                          contactos: profile.contactos)

        profileRepository.update(profile: updatedProfile)
    }
    
    func updateIsFavorited(profile: ProfileModel){
        var newFavorite = profile.isFavorited
        newFavorite.toggle()
        
        let updatedProfile = ProfileModel(id: profile.id ?? nil,
                                          isFavorited: newFavorite,
                                          nombre: profile.nombre,
                                          image: profile.image,
                                          edad: profile.edad,
                                          telefono: profile.telefono,
                                          direccion: profile.direccion,
                                          peso: profile.peso,
                                          estatura: profile.estatura ,
                                          sexo: profile.sexo,
                                          grupoAndRh: profile.grupoAndRh,
                                          alergias: profile.alergias,
                                          medicacion: profile.medicacion,
                                          enfermedades: profile.enfermedades,
                                          tratamientos: profile.tratamientos,
                                          antecedentes: profile.antecedentes,
                                          vacunas: profile.vacunas,
                                          donanteOrg: profile.donanteOrg,
                                          cirugiasPrev: profile.cirugiasPrev,
                                          implantes: profile.implantes,
                                          embarazos: profile.embarazos,
                                          partos: profile.partos,
                                          contactos: profile.contactos)

        profileRepository.update(profile: updatedProfile)
    }
    
    func delete (profile: ProfileModel){
        profileRepository.delete(profile: profile)
    }
}
