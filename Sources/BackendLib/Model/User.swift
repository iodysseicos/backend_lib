//
//  Usuario.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class User {
    //@Attribute(.unique) var email: String
    //TODO: make email unique
    public var email: String
    
    public var nome: String
    public var receivesNotification: Bool
    
    public init(email: String, nome: String, receivesNotification: Bool) {
        self.email = email
        self.nome = nome
        self.receivesNotification = receivesNotification
    }
}
