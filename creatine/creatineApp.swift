//
//  creatineApp.swift
//  creatine
//
//  Created by Felipe Santos on 13/12/24.
//

import SwiftUI
import SwiftData

@main
struct creatineApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabViewStyle()
            }
        }
        .modelContainer(for: Creatinine.self)
    }
}
