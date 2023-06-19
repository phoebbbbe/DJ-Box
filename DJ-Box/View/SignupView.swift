//
//  SignupView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct SignupView: View {
    @StateObject var user = User()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var navigateToLogin = false
      
    var body: some View {
        NavigationView{
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
                            Text("Email")
                                .foregroundColor(.white)
                                .padding(.trailing,90)
                            TextField("", text: $email)
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
                        //showAlert = true
                        user.register(email: email, password: password)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            navigateToLogin = true
                        }
                    }) {
                        Text("Sign up")
                            .fontWeight(.medium)
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 74.93, alignment: .topLeading)
                            .padding(.vertical, 13)
                            //.padding(.leading, 136)
                            //.padding(.trailing, 135)
                            .frame(width: 346, height: 50)
                            .background(djboxGradient)
                            .cornerRadius(15)
                            .frame(width: 346, height: 50)
                    }
                    .padding()
                    NavigationLink(destination: LoginView(), isActive: $navigateToLogin) { EmptyView() }
                    .alert(isPresented: $showAlert) {
                       Alert(title: Text("註冊成功"), message: Text("歡迎您成為DJ BOX的一員🎶"), dismissButton: .default(Text("確定")))
                    }

                    

                    
                    Spacer()
                }
            }
            
        }
       
    }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
