//
//  CycleMood.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

// this class makes the relationship between Mood and Cycle

import SwiftData
import SwiftUI

public enum MoodType: Codable, Equatable, Hashable {
    case angry
    case sad
    case saint
    case evil
}

@Model
public @available(macOS 14, *)
public class CycleMood {
    public var date: Date
    public @Relationship(deleteRule: .cascade) var cycle: Cycle
    public var mood: MoodType
    
    public init(date: Date, cycle: Cycle, mood: MoodType) {
        self.date = date
        self.cycle = cycle
        self.mood = mood
    }
}
