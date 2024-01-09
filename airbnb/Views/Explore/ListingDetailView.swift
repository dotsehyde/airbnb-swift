//
//  ListingDetailView.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    var listing:Listing = Listing.sampleData()[0]
    
    @Environment(\.dismiss) var dismiss
    
    init(listing: Listing) {
        self.listing = listing
        self._region = State(initialValue:  MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude:listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    @State private var region: MKCoordinateRegion
    var body: some View {
          ScrollView {
     
              ZStack(alignment: .topLeading) {
                  ListingCarousel(listing: listing)
                      .frame(height: 320)
                  Button {
                      dismiss()
                  } label: {
                      Image(systemName: "chevron.left")
                          .foregroundStyle(.black)
                          .imageScale(.large)
                          .background(Circle().fill(.white).frame(width: 40,height: 40))
                          .padding(.top, 60)
                          .padding(.leading,40)
                      
                  }

              }
              
                // Details
                VStack(alignment: .leading, spacing: 8) {
                    Text(listing.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 2){
                            Image(systemName: "star.fill")
                            Text(String(format:"%.2f",listing.rating))
                            Text(" - ")
                            Text("28 reviews")
                                .fontWeight(.semibold)
                                .underline()
                        }
                        Text("\(listing.city), \(listing.state)")
                    }
                    .font(.caption)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading)
//              Divider()
                //Host Info
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        VStack(alignment: .leading, spacing: 4){
                            Text("Entire villa hosted by \(listing.ownerName)")
                                .font(.headline)
                                .frame(width: 250, alignment: .leading)
                            HStack(spacing:2){
                                Text("\(listing.numberOfGuests) guests -")
                                Text("\(listing.numberOfBedrooms) bedrooms -")
                                Text("\(listing.numberOfBeds) beds -")
                                Text("\(listing.numberOfBathrooms) baths")
                            }
                            .font(.caption)
                        }
                        .frame(width: 300,alignment: .leading)
                        Spacer()
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64,height: 64)
                            .clipShape(Circle())
                    }
                    .padding()
                }
//              Divider()
                //Features
                VStack(alignment: .leading, spacing: 8){
                    ForEach(listing.feature){f in
                        HStack(spacing: 12) {
                            Image(systemName: f.icon)
                                .imageScale(.large)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(f.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                Text(f.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                        }
                        
                        .padding(.leading)
                    }
                }
                .padding(.vertical)
//              Divider()
                //Bedrooms View
                VStack(alignment: .leading, spacing: 16){
                    Text("Where you'll sleep")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack(spacing:16){
                            ForEach(1...listing.numberOfBedrooms, id:\.self){index in
                                VStack(alignment: .leading, spacing: 4){
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(index)")
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 132, height:100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .fill(.gray)
                                )
                                
                            }
                        }
                        
                    }
                    //                    .scrollTargetBehaviour(.paging)
                    
                }.padding()
                
//              Divider()
                //Listing Amenties
                VStack(alignment: .leading, spacing: 16){
                    Text("What this place offers")
                        .font(.headline)
                    ForEach(listing.amenities){ a in
                        HStack{
                            Image(systemName: a.icon)
                                .frame(width: 32)
                            Text(a.title)
                                .font(.footnote)
                            Spacer()
                        }
                    }
                }
                .padding()
//                Divider()
                //Map View
                VStack(alignment: .leading, spacing:16){
                    Text("Wher you'll be")
                        .font(.headline)
                    //
                    Map(coordinateRegion: $region)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                }
                .padding()
            }
          .padding(.bottom, 80)
          .overlay(
            alignment: .bottom,
            content: {
                VStack{
                    Divider()
                        .padding(.bottom)
                    HStack {
                        VStack(alignment: .leading){
                            Text("$\(String(format: "%.2f", listing.pricePerNight))")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("Total before taxes")
                                .font(.footnote)
                            Text("Oct 15 - 20")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()
                            
                        }
                        Spacer()
                        Button {
                            //TODO: Reserve btn
                        } label: {
                            Text("Reserve")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .frame(width: 140,height:40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        }
                     
                    }
                    .padding(.horizontal,32)
                    .padding(.bottom,20)
                 
                }
               
                .background(.white)
            }
                
          
          )
        
          .ignoresSafeArea()
          .navigationBarBackButtonHidden()
          .toolbar(.hidden, for: .tabBar)
    }
       
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(listing: Listing.sampleData()[0])
    }
}
