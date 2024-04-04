//
//  Period.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

import SwiftData
import SwiftUI

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class Period {
    @Attribute(.unique)
    public var day: Date
    public var intensity: Int
    @Relationship(deleteRule: .cascade)
    public var cycle: Cycle
    public init(day: Date, intensity: Int, cycle: Cycle) {
        self.day = day
        self.intensity = intensity
        self.cycle = cycle
    }
}
