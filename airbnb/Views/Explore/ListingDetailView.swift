//
//  ListingDetailView.swift
//  airbnb
//
//  Created by Benjamin. on 04/01/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
          ScrollView {
     
              ZStack(alignment: .topLeading) {
                  ListingCarousel()
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
                    Text("Miami Villa")
                        .font(.title)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 2){
                            Image(systemName: "star.fill")
                            Text("4.86")
                            Text(" - ")
                            Text("28 reviews")
                                .fontWeight(.semibold)
                                .underline()
                        }
                        Text("Miami, Florida")
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
                            Text("Entire villa hosted by Sarah Smith")
                                .font(.headline)
                                .frame(width: 250, alignment: .leading)
                            HStack(spacing:2){
                                Text("4 guests -")
                                Text("4 bedrooms -")
                                Text("4 beds -")
                                Text("3 baths")
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
                    ForEach(0...1,id:\.self){i in
                        HStack(spacing: 12) {
                            Image(systemName: "door.left.hand.open")
                                .imageScale(.large)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Self Check-In")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                Text("Check yourself in with the keypad")
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
                            ForEach(1..<5, id:\.self){index in
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
                    ForEach(0..<5){ feature in
                        HStack{
                            Image(systemName: "wifi")
                                .frame(width: 32)
                            Text("Wifi")
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
                    Rectangle()
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
                            Text("$500")
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
        ListingDetailView()
    }
}
