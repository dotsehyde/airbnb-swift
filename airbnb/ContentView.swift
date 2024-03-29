//
//  ContentView.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       BottomNavView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ExploreViewModel(service: ExploreService()))
    }
}
