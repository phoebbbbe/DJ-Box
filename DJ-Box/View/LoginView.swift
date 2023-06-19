//
//  LoginView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: UserManager
    @State private var email = ""
    @State private var password = ""
    
    @State private var showAlert = false
    @State private var alertText = ""
        
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                VStack {
                    Image("icon")
                    VStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "person")
                                    .foregroundColor(.white)
                                    .padding(.leading, 5)
                                Text("Account")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            TextField("", text: $email)
                            .foregroundColor(.white)
                            .padding(.all)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.white)
                                    .padding(.leading, 5)
                                Text("Password")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            SecureField("", text:$password)
                                .foregroundColor(.white)
                                .padding(.all)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                        }
                    }
                    .padding()

                    VStack {
                        Button() {
                            Task {
                                do {
                                    try await user.SignIn(email: email, password: password)
                                } catch {
                                    showAlert = true
                                    alertText = error.localizedDescription
                                }
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text("Login")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Image(systemName: "arrow.right.circle")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .frame(width: 200, height: 45)
                            .foregroundColor(.white)
                            .background(djboxGradient)
                            .cornerRadius(15)

                        }
                        .alert(alertText, isPresented: $showAlert, actions: {
                            Button("OK") { }
                        })

                        NavigationLink(destination: SignupView().environmentObject(user)) {
                           Text("Haven't account? Sign up now.")
                               .font(.subheadline)
                               .foregroundColor(.white)
                               .bold()
                               .padding(.top, 10)
                       }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
