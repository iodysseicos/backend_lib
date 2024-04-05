//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 05/04/24.
//

import SwiftData
import SwiftUI

//This class refers to libido intensidy on a day of an specific cycle

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class LibidoIntensity {
    
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

