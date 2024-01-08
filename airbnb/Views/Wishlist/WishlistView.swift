//
//  WishlistView.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 32){
              
                VStack(alignment: .leading, spacing: 4){
                    Text("Login to view your wishlists.")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("You can create, view, edit wishlists once you've logged in")
                        .font(.footnote)
                }.padding(.horizontal)
                
                Button{
                   
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.pink)).padding(.vertical)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
