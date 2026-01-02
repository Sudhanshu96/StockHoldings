//
//  UpstoxAssignmentApp.swift

import SwiftUI

@main
struct UpstoxAssignmentApp: App {
    private let dependencies = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            HoldingsView(viewModel: dependencies.makeHoldingsViewModel())
        }
    }
}
