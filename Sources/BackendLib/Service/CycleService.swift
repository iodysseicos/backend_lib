//
//  CycleService.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 30/03/24.
//

import SwiftData
import SwiftUI

@available(iOS 17, *)
@available(macOS 14, *)
@Observable
public class CycleService {
    var context: ModelContext
    public var cycles = [Cycle]()
    
    public init(context: ModelContext) {
        self.context = context
        fetchCycles()
    }
    
    private func fetchCycles() {
        var cycleDescriptor = FetchDescriptor<Cycle>()
        cycleDescriptor.includePendingChanges = true


        let results = try? context.fetch(cycleDescriptor)
        var newCycles = [Cycle]()
        for result in results ?? [] {
            newCycles.append(result)
        }
        
        cycles = newCycles
    }
    
    public func createCycle(startDate: Date, endDate: Date) -> Cycle {
        let cycle = Cycle(startDate: startDate, endDate: endDate)
        context.insert(cycle)
        fetchCycles()
        return cycle
    }
    
    public func addSymptom(cycle: Cycle, symptom: SymptomType, date: Date) {
        cycle.sympthoms?.append(CycleSymptom(day: Date(), symptom: .acne))
        fetchCycles()
    }
    
    public func addMood(cycle: Cycle, moodType: MoodType, date: Date) {
        cycle.moods?.append(CycleMood(date: date, mood: moodType))
        fetchCycles()
    }
    
    public func addSexualActivity(cycle: Cycle, didHaveSex: Bool, didUseCondom: Bool, date: Date) {
        let sexualActivity = cycle.sexualActivities?.first(where: {
            let day = Calendar.current.dateComponents([.day, .year, .month], from: $0.day)
            let activityDay = Calendar.current.dateComponents([.day, .year, .month], from: date)
            return [day.day, day.month, day.year] == [activityDay.day, activityDay.month, activityDay.year]
        })
        if let sexualActivity {
            context.delete(sexualActivity)
        }
        cycle.sexualActivities?.append(SexualActivity(day: date, didHaveSex: didHaveSex, didUseCondom: didUseCondom))
        fetchCycles()
    }
    
    public func removeSympthom(cycle: Cycle, symptom: SymptomType, date: Date) {
        var cycleSympthom: CycleSymptom?
        let currentSymDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        for sym in cycle.sympthoms ?? [] {
            let symDate = Calendar.current.dateComponents([.day, .year, .month], from: sym.day)
            if [symDate.day, 
                symDate.month,
                symDate.year] == [currentSymDate.day,
                                  currentSymDate.month,
                                  currentSymDate.year]
                && sym.symptom == symptom {
                cycleSympthom = sym
                break
            }
        }
        
        if cycleSympthom != nil {
            context.delete(cycleSympthom!)
        }
        fetchCycles()
    }
    
    public func removeMood(cycle: Cycle, moodType: MoodType, date: Date) {
        var cycleMood: CycleMood?
        let currentMoodDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        for mood in cycle.moods ?? [] {
            let moodDate = Calendar.current.dateComponents([.day, .year, .month], from: mood.date)
            if [moodDate.day,
                moodDate.month,
                moodDate.year] == [currentMoodDate.day,
                                   currentMoodDate.month,
                                   currentMoodDate.year]
                && mood.mood == moodType {
                cycleMood = mood
                break
            }
        }
        
        if cycleMood != nil {
            context.delete(cycleMood!)
        }
        fetchCycles()
    }
        
}
