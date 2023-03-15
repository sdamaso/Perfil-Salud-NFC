//
//  NFCController.swift
//  Perfil Salud NFC
//
//  Created by Samuel Dámaso  on 15/3/23.
//

import Foundation
import CoreNFC

class NFCController: NSObject, NFCTagReaderSessionDelegate{
    var session: NFCReaderSession?
    
    init(session: NFCReaderSession? = nil) {
        self.session = session
        print("Se comienza una sesión de lectura")
    }
    
    func scanNFC() {
        self.session = NFCTagReaderSession(pollingOption: .iso14443, delegate: self, queue: nil)
        self.session?.alertMessage = "Acerque el iPhone al tag NFC"
        self.session?.begin()
    }
        
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Sesión para la lectura del tag NFC iniciada!")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("Error al iniciar la sesión de lectura del tag NFC")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("Leyendo información")
        if tags.count > 1{
            self.session?.alertMessage = "Se han detectado más de un tag NFC al mismo tiempo. Intentelo de nuevo"
            self.session?.invalidate()
        }
        
        let tag = tags.first!
        
        session.connect(to: tags.first!) { (error) in
            if nil != error{
                self.session?.invalidate(errorMessage: "La conexión ha fracasado")
            }
            
            switch tag {
            case let .iso7816(sTag):
                let UID = sTag.identifier.map{ String(format: "%.2hhx", $0)}.joined()
                print("UID: ", UID)
                self.session?.alertMessage = "UID capturado: \(UID)"
                self.session?.invalidate()
            case .feliCa(_):
                session.invalidate(errorMessage: "Tag not valid.")
                return
            case let .iso15693(sTag):
                let UID = sTag.identifier.map{ String(format: "%.2hhx", $0)}.joined()
                print("UID: ", UID)
                self.session?.alertMessage = "UID capturado: \(UID)"
                self.session?.invalidate()
            case let .miFare(sTag):
                let UID = sTag.identifier.map{ String(format: "%.2hhx", $0)}.joined()
                print("UID: ", UID)
                self.session?.alertMessage = "UID capturado: \(UID)"
                self.session?.invalidate()
            @unknown default:
                session.invalidate(errorMessage: "Tag not valid.")
                return
            }
        }
    }
}
