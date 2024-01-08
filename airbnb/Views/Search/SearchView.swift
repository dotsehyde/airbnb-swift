//
//  SearchView.swift
//  airbnb
//
//  Created by Benjamin. on 05/01/2024.
//

import SwiftUI

enum SelectedType {
    case location
    case date
    case guest
}

struct SearchView: View {
    @Binding var isSearchOpen:Bool
    @State var location = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var guestCount = 0
    @State var type:SelectedType = .location
    var body: some View {
        VStack{
            HStack {
                Button {
                    withAnimation() {
                        isSearchOpen.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                }
                Spacer()
                if !location.isEmpty{
                    Button {
                        withAnimation() {
                            location = ""
                        }
                    } label: {
                        Text("Clear")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                    }
                }
                
            }
            .padding(.horizontal)
            if type == .location{
                VStack(alignment: .leading) {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack(spacing:4)
                    {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $location)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                        
                    }
                }
                .padding()
                .background(.white)
                .clipShape( RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
            }else{
                ClosedView(title: "Where", desc: "Search")
                    .onTapGesture {
                        withAnimation {
                            type = .location
                        }
                    }
            }
            
            if type == .date{
                VStack(alignment: .leading) {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    DatePicker(selection: $startDate, displayedComponents: .date) {
                        Text("From")
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    Divider()
                    DatePicker(selection: $endDate, displayedComponents: .date) {
                        Text("End")
                        
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                }
                .padding()
                .background(.white)
                .clipShape( RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
            }else{
                ClosedView(title: "When", desc: "Add dates")
                    .onTapGesture {
                        withAnimation {
                            type = .date
                        }
                    }
            }
            if type == .guest{
                VStack(alignment: .leading) {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper("\(guestCount) Adults") {
                        guestCount += 1
                    } onDecrement: {
                        if guestCount < 1 {
                            return
                        }
                        guestCount -= 1
                    }
                    .fontWeight(.semibold)
                }
                
                .padding()
                .background(.white)
                .clipShape( RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
            }else{
                ClosedView(title: "Who", desc: "Add guests")
                    .onTapGesture {
                        withAnimation {
                            type = .guest
                        }
                    }
            }
            
            
            
            
        }
    }
}

struct ClosedView: View {
    var title: String
    var desc:String
    var body: some View{
        HStack{
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
            Spacer()
            Text(desc)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding()
        .background(.white)
        .clipShape( RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearchOpen: .constant(false))
    }
}
