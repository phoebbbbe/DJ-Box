//
//  ContentView.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/5/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager

    var body: some View {
        if user.userIsLoggedin {
            HomepageView()
                .environmentObject(songManager)
                .environmentObject(songListManager)
                
        } else {
            LoginView()
                .environmentObject(user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
            .environmentObject(SongManager())
            .environmentObject(SongListManager())
    }
}
