//
//  ProfileList.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/2/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var profileViewModel: ProfileViewModel
    
    @State private var addProfile = false
    @State private var editProfile = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach (profileViewModel.profiles) { profile in
                    NavigationLink{
                        ProfileDetailsView(profile: profile)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar{
                                NavigationLink ("Editar"){
                                    ProfileEditingView(profileViewModel: profileViewModel, profile: profile)
                                }
                            }
                    }label: {
                        ProfileEntry(profile: profile)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button{
                            profileViewModel.delete(profile: profile)
                        }label: {
                            Image(systemName: "trash.fill")
                            
                        }
                        .tint(Color.red)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true){
                        Button{
                            profileViewModel.updateIsFavorited(profile: profile)
                        }label: {
                            Image(systemName: "star.fill")
                        }
                        .tint(Color.yellow)
                    }
                }
            }
            .task { profileViewModel.getAllProfiles() }
            .onAppear(perform: {profileViewModel.getAllProfiles()})
            .toolbar{
                ToolbarItem (placement: .navigationBarLeading){
                    Button{
                        authenticationViewModel.logout()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        addProfile.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Perfiles")
            .sheet(isPresented: $addProfile){
                ProfileCreationView(profileViewModel: profileViewModel)
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(authenticationViewModel: AuthenticationViewModel(), profileViewModel: ProfileViewModel())
    }
}
