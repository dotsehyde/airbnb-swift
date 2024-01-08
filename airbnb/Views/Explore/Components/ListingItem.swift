//
//  ListingItem.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI

struct ListingItem: View {

    var body: some View {
        VStack(spacing: 8){
            //images
            ListingCarousel()
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //Details
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("$567")
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
                    Text("4.86")
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
