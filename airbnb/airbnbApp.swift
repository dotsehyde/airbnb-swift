//
//  airbnbApp.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

@main
struct airbnbApp: App {
    @StateObject var exploreViewModel = ExploreViewModel(service: ExploreService())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(exploreViewModel)
        }
    }
}
