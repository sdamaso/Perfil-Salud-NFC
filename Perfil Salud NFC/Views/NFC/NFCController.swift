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
    var UID: String?

    init(session: NFCReaderSession? = nil, UID: String? = nil) {
        self.session = session
        self.UID = UID
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
        let tag = tags.first!
        
        if tags.count > 1{
            self.session?.alertMessage = "Se han detectado más de un tag NFC al mismo tiempo. Intentelo de nuevo"
            self.session?.invalidate()
        }
        
        session.connect(to: tags.first!) { (error) in
            if nil != error{
                self.session?.invalidate(errorMessage: "La conexión ha fracasado")
            }
            if case let .miFare(sTag)=tag{
                self.UID = sTag.identifier.map{ String(format: "%.2hhx", $0)}.joined()
                print("UID: ", self.UID!)
                self.session?.alertMessage = "UID capturado: \(self.UID!)"
                self.session?.invalidate()
            }
        }
    }
}
