//
//  Medication.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData

//This class refers to a contraceptive method or any other medication

@Model
@available(macOS 14, *)
public class Medication {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}
