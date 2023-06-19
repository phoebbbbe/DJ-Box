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
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager

    var body: some View {
        if userManager.userIsLoggedin {
            HomepageView()
                .environmentObject(userManager)
                .environmentObject(songManager)
                .environmentObject(songListManager)
                
        } else {
            LoginView()
                .environmentObject(userManager)
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
