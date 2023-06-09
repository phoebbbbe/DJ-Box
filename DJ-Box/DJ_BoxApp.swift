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
            LoginView()
        }
    }
}

extension View {
    var djboxGradient: LinearGradient {
        // 漸層顏色的程式碼
        return LinearGradient(gradient: Gradient(colors: [
            Color(red: 0.66, green: 0.96, blue: 0.71),
            Color(red: 0.80, green: 0.97, blue: 0.52),
            Color(red: 0.84, green: 0.98, blue: 0.47),
            Color(red: 0.66, green: 0.96, blue: 0.71)
        ]), startPoint: .leading, endPoint: .trailing)
    }
}
