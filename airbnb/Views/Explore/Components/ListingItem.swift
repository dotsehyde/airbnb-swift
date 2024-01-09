//
//  ListingItem.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ListingItem: View {
    var listing: Listing = Listing.sampleData()[0]
    var body: some View {
        VStack(spacing: 8){
            //images
            ListingCarousel(listing: listing)
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //Details
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("$\(String(format: "%.2f", listing.pricePerNight))")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                .font(.footnote)
                Spacer()
                //Rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text(String(format:"%.2f",listing.rating))
                }
                
                .foregroundColor(.black)
            }
        }
        .padding()
    }
}


struct ListingItem_Previews: PreviewProvider {
    static var previews: some View {
        ListingItem()
            .previewLayout(.sizeThatFits)
    }
}
