//
//  User.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/9.
//  Modify by 林寧 on 2023/6/19.

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class UserManager: ObservableObject {
    @Published var userIsLoggedin: Bool = false
    @Published var userIsRegister: Bool = false
    @Published var user: User = User()
    
    init() {
        
    }
    
    func AddUser() {

        let db = Firestore.firestore()
        if let user = Auth.auth().currentUser {
            
            print(user.uid, user.email, user.displayName, user.photoURL)
            
            let newUser = User(name: user.displayName, email: user.email)
            
            do {
                try db.collection("users").document(user.uid).setData(from: newUser)
            } catch {
                print(error)
                fatalError("ERROR: cant't add song user.")
            }
        }
    }
    
    func SignIn(email: String , password: String) async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("OK: \(authResult.user.uid)")
            self.Login()
            
        } catch {
            print("ERROR: \(error.localizedDescription)")
            throw error
        }
    }
    
    func Login() {
        Auth.auth().addStateDidChangeListener { theAuth, theUser in
            if theUser != nil {
                self.userIsLoggedin = true
                self.AddUser()
            }
        }
    }
    
    func Logout() {
        do {
           try Auth.auth().signOut()
        } catch {
           print(error)
        }
    }
    
    func SignUp(email: String , password: String) async throws {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print("OK: \(authResult.user.uid)")
            
        } catch {
            print("ERROR: \(error.localizedDescription)")
            throw error
        }
    }
    
}

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String? = ""
    var email: String? = ""
}
