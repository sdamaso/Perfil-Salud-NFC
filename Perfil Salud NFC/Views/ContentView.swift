//
//  ContentView.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 9/2/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Perfil")
                        
                }
                                
            NFCReaderView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Escanear")
                }
                
                
        }
     
    }

    

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
