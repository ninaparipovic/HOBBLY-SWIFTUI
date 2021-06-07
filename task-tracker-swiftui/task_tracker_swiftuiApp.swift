//
//  task_tracker_swiftuiApp.swift
//  task-tracker-swiftui
//
//

import SwiftUI
import RealmSwift

let app = App(id: "tasktracker-svrtk") // TODO: Set the Realm application ID

@main
struct task_tracker_swiftuiApp: SwiftUI.App {
    @StateObject var state = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}
