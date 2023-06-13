//
//  ContentView.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/5/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
               .ignoresSafeArea()
            /* Test Firebase - Read data */
            VStack {
                Text("Hello World!")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
