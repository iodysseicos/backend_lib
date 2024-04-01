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
    public @Relationship(deleteRule: .cascade) var user: User
    public @Relationship(deleteRule: .cascade) var medication: Medication
    public var frequencyOfUseInDays: Int
    
    public init(user: User, medication: Medication, frequencyOfUseInDays: Int) {
        self.user = user
        self.medication = medication
        self.frequencyOfUseInDays = frequencyOfUseInDays
    }
}
