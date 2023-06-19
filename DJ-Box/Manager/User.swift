//
//  User.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/9.
//

import Foundation
import Firebase
import FirebaseAuth

class User: ObservableObject {
    @Published var userIsLoggedin = false
    init(){
        
    }
    
    func login(email: String , password: String){
        Auth.auth().signIn(withEmail:  email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
        Auth.auth().addStateDidChangeListener{theAuth,theUser in
            if theUser != nil{
                self.userIsLoggedin = true
                print("succesd.")
            }
            
        }
        
    }
    
    func logout() {
                do {
                   try Auth.auth().signOut()
                } catch {
                   print(error)
                }
            }
    
    func register(email: String , password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}
