//
//  ExploreView.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var exploreViewModel: ExploreViewModel
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
                        ForEach(exploreViewModel.listings){listing in
                            NavigationLink {
                                ListingDetailView(listing: listing)
                            } label: {
                                ListingItem(listing: listing)
                            }
                        }
                        
                    }
                }
            }
            .overlay(alignment: .bottom, content: {
                Button{
                    
                }label: {
                    Label("Map", systemImage: "map")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .padding(.bottom)
            })
           
       
        }
       
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(ExploreViewModel(service: ExploreService()))
    }
}
