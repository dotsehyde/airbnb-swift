//
//  ListingCarousel.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ListingCarousel: View {
     var images:[String] = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    var body: some View {
        TabView{
            ForEach(images, id:\.self){img in
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
