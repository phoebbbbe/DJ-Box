//
//  DJ_BoxApp.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/5/24.
//

import SwiftUI
import Firebase

@main
struct DJ_BoxApp: App {
    
    init() {
            FirebaseApp.configure()
    }
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
