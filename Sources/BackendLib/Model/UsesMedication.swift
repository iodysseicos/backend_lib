//
//  UsesMedication.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData

// this class makes the relation between the user and the medication

@Model
@available(macOS 14, *)
public class UsesMedication {
    @Relationship(deleteRule: .cascade)
    public var user: User
    
    @Relationship(deleteRule: .cascade)
    public var medication: Medication
    
    public var frequencyOfUseInDays: Int
    
    public init(user: User, medication: Medication, frequencyOfUseInDays: Int) {
        self.user = user
        self.medication = medication
        self.frequencyOfUseInDays = frequencyOfUseInDays
    }
}
