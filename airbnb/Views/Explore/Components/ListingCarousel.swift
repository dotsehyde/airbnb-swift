//
//  ListingCarousel.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ListingCarousel: View {
    var listing: Listing = Listing.sampleData()[0]
    var body: some View {
        TabView{
            ForEach(listing.imageUrls, id:\.self){img in
              Image(img)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
        
    }
}

struct ListingCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ListingCarousel()
    }
}
