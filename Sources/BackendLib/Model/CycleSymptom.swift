//
//  CycleSymptom.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 28/03/24.
//

// Makes the relationship between Symptom and a Cycle

import SwiftData
import SwiftUI

public enum SymptomType: Codable, Equatable, Hashable {
    case acne
    case backpain
    case bloating
    case constipation
    case cramps
    case diarrhea
    case headache
    case insomnia
    case lackofappetite
    case largeappetite
    case nausea
    case tenderbreasts
    case tiredness
}


@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class CycleSymptom {
    public var day: Date
    public var symptom: SymptomType
    
    public init(day: Date, symptom: SymptomType) {
        self.day = day
        self.symptom = symptom
    }
    
    public var cycle: Cycle?
}
