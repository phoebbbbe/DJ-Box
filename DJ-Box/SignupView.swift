//
//  SignupView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct SignupView: View {
    @State private var firstName: String = ""
      @State private var lastName: String = ""
      @State private var username: String = ""
      @State private var password: String = ""
      
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            VStack {
                Text("Sign up now")
                    .font(.system(size: 40))
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .padding(.top,180)
                
                HStack{
                    VStack {
                        Text("First Name")
                            .foregroundColor(.white)
                            .padding(.trailing,50)
                        TextField("", text: $firstName)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 40)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                    }
                    .padding()
                    
                    VStack {
                        Text("Last Name")
                            .foregroundColor(.white)
                            .padding(.trailing,50)
                        TextField("", text: $lastName)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 40)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                    }
                    .padding()
                }
               
                HStack{
                    VStack {
                        Text("Username")
                            .foregroundColor(.white)
                            .padding(.trailing,50)
                        TextField("", text: $username)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 40)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                    }
                    .padding()
                    
                    VStack {
                        Text("Password")
                            .padding(.trailing,50)
                            .foregroundColor(.white)
                        SecureField("", text: $password)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 40)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                    }
                    .padding()
                }
            
                
                Button(action: {
                    // 在此处添加注册按钮的操作
                }) {
                    Text("Sign up")
                        .fontWeight(.medium)
                        .font(.title3)
                        .foregroundColor(.black)
                        .frame(width: 74.93, alignment: .topLeading)
                        .padding(.vertical, 13)
                        .padding(.leading, 136)
                        .padding(.trailing, 135)
                        .frame(width: 346, height: 50)
                        .background(djboxGradient)
                        .cornerRadius(15)
                        .frame(width: 346, height: 50)
                }
                .padding()
                
                Spacer()
            }
        }
        
    }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
