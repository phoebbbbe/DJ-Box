//
//  LoginView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    //@EnvironmentObject var user: User
    @State var user = User()
    
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            VStack{
                Image("icon")
                
                VStack(spacing:0){
                    Text("Account")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(.leading,25)
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 350, height: 80)
                        .overlay(
                            HStack {
                                Image(systemName: "person")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 4)
                                Spacer()
                            }
                        )
                    // 调整尺寸
                    
                    Text("Password")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(.leading,25)
                    
                    
                    TextField("", text:$password)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 350, height: 80)
                        .overlay(
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 4)
                                Spacer()
                            }
                        )
                    Button {
                        user.login(email: email, password: password)
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .padding(.trailing, 4)
                            Text("Login")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 80)
                                .foregroundColor(.black)
                                .background(self.djboxGradient)
                                .cornerRadius(12)
                                
                        }
                    }
                    
                    Text("Haven't account? Sign up now.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding(.top,20)
                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(User())
    }
}
