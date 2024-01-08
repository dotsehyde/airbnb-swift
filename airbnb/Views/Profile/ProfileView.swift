//
//  ProfileView.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import SwiftUI

struct ListOptions: Identifiable {
    let id:Int
    let title:String
    let icon:String
}

struct ProfileView: View {
    var listOpt: [ListOptions] = [
        .init(id: 1, title: "Settings", icon: "gear"),
        .init(id:2, title: "Accessiblity",icon:"gear"),
        .init(id:3, title: "Visit the Help Center", icon:"questionmark.circle")
    ]
    @State private var showLoginForm = false
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 8)
        {
            Text("Profile")
                .font(.largeTitle)
                .bold()
            Text("Login to start planning your trip."
            ).font(.subheadline)
            
            Button{
                withAnimation {
                    showLoginForm.toggle()
                }
            }label: {
                Text("Log in")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 8).fill(.pink)).padding(.vertical)
            }
            HStack(){
                Text("Don't have an account?"
                )
                Text("Signup")
                    .underline()
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            
            ForEach(listOpt) { data in
                VStack(spacing: 15){
                    HStack{
                        Image(systemName: data.icon)
                            .bold()
                        Text(data.title)
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Divider()
                }
            }
            .padding(.top,10)
            
        }
        .padding()
        .sheet(isPresented: $showLoginForm) {
            VStack{
                HStack{
                    Spacer()
                    Button {
                        withAnimation {
                            showLoginForm.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark.circle")
                            .imageScale(.large)
                            .foregroundColor(.gray)
                            .padding(2)
                    }
                    
                }
                Divider()
               Image("airbnb")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.vertical)
                TextField("Enter your email",text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray4).opacity(0.2)))
                TextField("Enter your password",text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemGray4).opacity(0.2)))
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .fontWeight(.semibold)
                    }

                }.padding(.top,5)
                Button{
                    withAnimation {
                        showLoginForm.toggle()
                    }
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.pink)).padding(.vertical)
                }
                Spacer()
                Divider()
                Button {
                    
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Signup")
                            .underline()
                    }
                    .fontWeight(.semibold)
                    .padding()
                    
                }
                
            }.padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
