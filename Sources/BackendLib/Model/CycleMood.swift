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
    case anxious
    case apathetic
    case calm
    case confused
    case emotional
    case energetic
    case happy
    case irritated
    case sad
    case selfcritical
    case tired
}

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class CycleMood {
    public var date: Date
    
    
    public var mood: MoodType
    
    public init(date: Date, mood: MoodType) {
        self.date = date
        self.mood = mood
    }
    
    public var cycle: Cycle?
}
