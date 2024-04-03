//
//  CycleService.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 30/03/24.
//

import SwiftData
import SwiftUI

@available(macOS 14, *)
@Observable
public class CycleService {
    var context: ModelContext
    public var cycles = [Cycle]()
    
    public init(context: ModelContext) {
        self.context = context
        fetchCycles()
    }
    
    public func fetchCycles() {
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
    
    /*
    func getCycleSymptom(cycle: Cycle) -> [CycleSymptom] {
        let cycledate = cycle.startDate
        
        var sympthonDescriptor = FetchDescriptor<CycleSymptom>(
            predicate: #Predicate<CycleSymptom> {
                $0.cycle.startDate == cycledate
            }
        )

        sympthonDescriptor.includePendingChanges = true


        let results = try? context.fetch(sympthonDescriptor)
        var cycleSymptoms = [CycleSymptom]()
        for result in results ?? [] {
            cycleSymptoms.append(result)
        }
        
        return cycleSymptoms
    }
     */
}
