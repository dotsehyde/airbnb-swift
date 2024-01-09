//
//  BottomNavView.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import SwiftUI

struct BottomNavView: View {
    
    var body: some View {
        TabView{
            ExploreView()
              
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                
            WishlistView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .tint(.pink)
        
    }
}

struct BottomNavView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavView()
    }
}
