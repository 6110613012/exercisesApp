//
//  MyWorkout_SUNApp.swift
//  MyWorkout_SUN
//
//  Created by by Sunanta Chuathue on 19/9/2564 BE.
//

import SwiftUI

@main
struct MyWorkout_SUNApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
                }
                .environmentObject(HistoryStore())
        }
    }
}
