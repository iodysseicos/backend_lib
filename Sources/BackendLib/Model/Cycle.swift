//
//  Cycle.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData
import SwiftUI

@Model
@available(macOS 14, *)
public class Cycle {
    
    public @Attribute(.unique) var startDate: Date
    public var endDate: Date
    public init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    @Relationship(deleteRule: .cascade)
    public var sympthoms: [CycleSymptom]?
    
}
