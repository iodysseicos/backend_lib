//
//  SexualActivity.swift
//  
//
//  Created by Caio Melloni dos Santos on 08/04/24.
//

import SwiftData
import SwiftUI

@available(iOS 17, *)
@available(macOS 14, *)
@Model
public class SexualActivity {
    public var day: Date
    public var didHaveSex: Bool
    public var didUseCondom: Bool
    
    public init(day: Date, didHaveSex: Bool, didUseCondom: Bool) {
        self.day = day
        self.didHaveSex = didHaveSex
        self.didUseCondom = didUseCondom
    }
    
    public var cycle: Cycle?
}
