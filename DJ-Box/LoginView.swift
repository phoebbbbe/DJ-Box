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
    @State private var isLoggedIn = false
    @State private var loginErrorAlert = false
    //@EnvironmentObject var user: User
    @State var user = User()
    
    var body: some View {
        NavigationView{
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
                            .padding(.bottom,12)
                        TextField("", text: $email)
                            .frame(width: 350, height: 50)
                            .background(Color.white.opacity(0.3))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .cornerRadius(15)
                            .overlay(
                                HStack {
                                    Image(systemName: "person")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 25)
                                        .padding(.trailing, 4)
                                    Spacer()
                                }
                            )
                        
                        Text("Password")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            
                            .padding(.leading,25)
                            .padding(.bottom,12)
                            .padding(.top,20)
                        
                        
                        SecureField("", text:$password)
                            .frame(width: 350, height: 50)
                            .background(Color.white.opacity(0.3))
                            .multilineTextAlignment(.center)
                            .cornerRadius(15)
                            .overlay(
                                HStack {
                                    Image(systemName: "lock")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 25)
                                        .padding(.trailing, 4)
                                    Spacer()
                                }
                            )
                            .padding(.bottom,30)
                        Button {
                            isLoggedIn = true
                            user.login(email: email, password: password)

                        } label: {
                            HStack {
                                Text("Login")
                                    .fontWeight(.medium)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .frame(width: 50, alignment: .topLeading)
                                
                                Image(systemName: "arrow.right.circle")
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 13)
                            .padding(.leading, 136)
                            .padding(.trailing, 135)
                            .frame(width: 346, height: 50)
                            .background(djboxGradient)
                            .cornerRadius(15)
                            
                            }
                            .alert(isPresented: $loginErrorAlert){
                                Alert(title: Text("登入失敗"),
                                message: Text("請檢查您的帳號和密碼"),
                                      dismissButton: .default(Text("確定")))
                            }
                        
                            NavigationLink(destination: HomepageView(), isActive: $isLoggedIn) {
                                EmptyView()
                            }
                            .onChange(of: user.userIsLoggedin){isLoggedIn in self.isLoggedIn = isLoggedIn
                                if !isLoggedIn{
                                    loginErrorAlert = true
                                }
                            //.hidden()
                            
                        }
                        NavigationLink(destination: SignupView()) {
                                   Text("Haven't account?\nSign up now.")
                                       .font(.subheadline)
                                       .foregroundColor(.white)
                                       .bold()
                                       .multilineTextAlignment(.center)
                                       .lineSpacing(5)
                                       .padding(.top, 20)
                                       
                               }
                    }
                    
                }
                .onReceive(user.$userIsLoggedin, perform: { isLoggedIn in
                    self.isLoggedIn = isLoggedIn
                })
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
