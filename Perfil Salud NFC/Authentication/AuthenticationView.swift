//
//  AuthenticationView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/4/23.
//

import SwiftUI


struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    @State var email=""
    @State var password=""
    @State var rePassword=""
    @State var createAccount=false
    
    @ViewBuilder
    private var createAcc: some View{
        VStack{
            Group {
                Text("Bienvenido a")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top,50)
                    .foregroundColor(Color("Color Logo"))
                Text("PERFIL SALUD")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Color Logo"))
                
                Image("Perfil Salud Icon V2.0")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(18.75)
                    .padding(.top, 25)
            }
            
            VStack {
                TextField("Correo Electrónico", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .foregroundColor(.white)
                    .background(.white.opacity(0.1))
                    .cornerRadius(15)
                
                SecureField("Contraseña", text: $password)
                    .textInputAutocapitalization(.none)
                    .padding()
                    .foregroundColor(.white)
                    .background(.white.opacity(0.1))
                    .cornerRadius(15)
                
                Button {
                    authenticationViewModel.createNewUser(email: email, password: password)
                    email = ""
                    password = ""
                    authenticationViewModel.error = ""
                } label: {
                    Text("Crear cuenta")
                        .foregroundColor(.black)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 12)
                        .background(Color("Color Logo"))
                        .cornerRadius(15)
                }
                .padding(.top,15)
                
                if let error = authenticationViewModel.error{
                    Text(error)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top,10)
                }
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .padding(.all)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Group {
                    Text("PERFIL SALUD")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top,50)
                        .foregroundColor(Color("Color Logo"))
                    
                    Image("Perfil Salud Icon V2.0")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(18.75)
                        .padding(.top, 25)
                }
                VStack {
                    TextField("Correo Electrónico", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .foregroundColor(.white)
                        .background(.white.opacity(0.1))
                        .cornerRadius(15)
                    
                    SecureField("Contraseña", text: $password)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .foregroundColor(.white)
                        .background(.white.opacity(0.1))
                        .cornerRadius(15)
                    
                    Button {
                        authenticationViewModel.login(email: email, password: password)
                        email = ""
                        password = ""
                        authenticationViewModel.error = ""
                    } label: {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 12)
                            .background(Color("Color Logo"))
                            .cornerRadius(15)
                    }
                    .padding(.top,15)
                    
                    if let error = authenticationViewModel.error{
                        Text(error)
                            .bold()
                            .font(.body)
                            .foregroundColor(.red)
                            .padding(.top,10)
                    }
                }
                .padding(.top, 50)
                
                Spacer()
                
                HStack {
                    Text("¿No estas registrado?")
                    Button {
                        createAccount.toggle()
                        authenticationViewModel.error = ""
                    } label: {
                        Text("Crea tu cuenta")
                            .foregroundColor(Color("Color Logo"))
                            .underline()
                    }
                }
            }
            .padding(.all)
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(3))
            self.launchScreenState.dismiss()
        }
        .sheet(isPresented: $createAccount) {
            createAcc
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
