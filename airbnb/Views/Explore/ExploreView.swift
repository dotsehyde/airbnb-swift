//
//  ExploreView.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var isSearchOpen = false
    var body: some View {
        NavigationStack{
            ScrollView{
                if isSearchOpen{
                    SearchView(isSearchOpen: $isSearchOpen)
                }else{
                    SearchBar()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)){
                                isSearchOpen.toggle()
                            }
                        }
                    LazyVStack(spacing: 0) {
                        ForEach(0...10, id: \.self){listing in
                            NavigationLink {
                                ListingDetailView()
                            } label: {
                                ListingItem()
                            }
                        }
                        
                    }
                }
            }
           
       
        }
       
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
