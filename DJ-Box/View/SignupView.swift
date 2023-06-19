//
//  SignupView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var user: UserManager
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showOKAlert = false
    @State private var showERRORAlert = false
    @State private var errorAlertText = ""
    
    @State private var showHomeView = false
      
    var body: some View {
        NavigationView {
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
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("", text: $name)
                            .foregroundColor(.white)
                            .padding(.all)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                        }
                        .padding()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                TextField("", text: $email)
                                .foregroundColor(.white)
                                .padding(.all)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                            }
                            .padding()
                            
                            VStack(alignment: .leading) {
                                Text("Password")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                SecureField("", text: $password)
                                .foregroundColor(.white)
                                .padding(.all)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                            }
                            .padding()
                        }
                        
                    }
                    
                    Button() {
                        Task {
                            do {
                                try await user.SignUp(email: email, password: password)
                                showOKAlert = true
                            } catch {
                                showERRORAlert = true
                                errorAlertText = error.localizedDescription
                            }
                        }
                    } label: {
                        Text("Sign up")
                            .fontWeight(.medium)
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 346, height: 50)
                            .background(djboxGradient)
                            .cornerRadius(15)
                    }
                    .padding()
                    .alert(errorAlertText, isPresented: $showERRORAlert, actions: {
                        Button("再試一次") { }
                    })
                    .alert("註冊成功!歡迎您成為DJ BOX的一員🎶", isPresented: $showOKAlert, actions: {
                        Button("確定") {
                            showHomeView = true
                        }
                    })
                    
                    NavigationLink(
                        destination:
                            HomepageView()
                                .environmentObject(songManager)
                                .environmentObject(songListManager),
                        isActive: $showHomeView
                    ) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Spacer()
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
       
    }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .environmentObject(UserManager())
            .environmentObject(SongManager())
            .environmentObject(SongListManager())
    }
}
