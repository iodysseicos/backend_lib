//
//  Cycle.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData
import SwiftUI

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class Cycle {
    
    @Attribute(.unique)
    public var startDate: Date
    
    public var endDate: Date
    public init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    @Relationship(deleteRule: .cascade)
    public var sympthoms: [CycleSymptom]?
    
    @Relationship(deleteRule: .cascade)
    public var moods: [CycleMood]?
    
}
