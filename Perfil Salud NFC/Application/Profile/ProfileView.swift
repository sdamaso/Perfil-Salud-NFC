//
//  ProfileList.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/2/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @State private var addProfile = false

    var body: some View {
        NavigationView{
            List{
                ForEach (profileViewModel.profiles) { profile in
                   
                    NavigationLink{
                        ProfileDetailsView(profile: profile)
                    }label: {
                        ProfileEntry(profile: profile)
                    }
                    .swipeActions(edge: .leading){
                        Button{
                            print("Borrar")
                        }label: {
                            Image(systemName: "trash.fill")
                                
                        }
                        .tint(Color.red)
                    }
                    
//                    NavigationLink{
//                        ProfileDetailsView()
//                    }label: {
//                        ProfileEntry(profile: profiles)
//                    }
                }
            }
            
            .task {
                profileViewModel.getAllProfiles()
            }
            .toolbar{
                Button{
                    addProfile.toggle()
                    //FUNCION AÑADIR PERFIL
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Perfiles")
            .sheet(isPresented: $addProfile){
                //Create Profile View
            }
        }
        
    }
        
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileViewModel: ProfileViewModel())
            .previewDevice("iPhone 11")
    }
}
