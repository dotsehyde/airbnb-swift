//
//  SearchBar.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var exploreViewModel: ExploreViewModel
    var body: some View {
        HStack(spacing:8){
           Image(systemName: "magnifyingglass")
                .imageScale(.large)
            VStack(alignment: .leading, spacing:2){
                Text(exploreViewModel.location.isEmpty ? "Where to?" : exploreViewModel.location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Anywhere - Any Week - Any Guest")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }

         
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay(Capsule()
            .stroke(lineWidth: 0.5)
            .foregroundStyle(Color(.systemGray4))
            .shadow(color: .black.opacity(0.4), radius: 2)
        
        )
        .padding()
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .environmentObject(ExploreViewModel(service: ExploreService()))
    }
}
