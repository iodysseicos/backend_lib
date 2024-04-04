//
//  BackendProvider.swift
//  dataTest
//
//  Created by Caio Melloni dos Santos on 30/03/24.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@available(macOS 14, *)
public struct BackendProvider<Content: View>: View {
    @ViewBuilder let firstView: Content
    
    public init(@ViewBuilder _ view: () -> Content) {
        self.firstView = view()
    }
    
    public var body: some View {
        Group {
            firstView
        }
    }
}
