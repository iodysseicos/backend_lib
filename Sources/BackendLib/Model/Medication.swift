//
//  Medication.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData

//This class refers to a contraceptive method or any other medication

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class Medication {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}
