//
//  MysongView.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/19.
//

import SwiftUI

struct MysongView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager
    
    var songList: SongList
        
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            
            VStack {
                Text(songList.name)
                    .bold()
                    .font(.system(size: 33))
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .padding(.bottom, 50)
                
                ScrollView(.vertical) {
                    LazyVStack(spacing: 20) {
                        ForEach(songList.songs, id: \.self) { song_id in
                            NavigationLink {
//                                if let videlID = extractVideoID(from: data.url) {
//                                    WKWebViewWrapper(videoID: videlID)
//                                } else {
//                                    Text(data.title)
//                                }
                                Text(song_id)
                            } label: {
                                HStack {
                                    Text("\(song_id)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding(.trailing,30)
                                }
                            }
                            
                            Divider()
                                .background(Color.white)
                        }
                    }
                    .padding(.vertical, 30)
                    .background(Color.white.opacity(0.4).cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MysongView_Previews: PreviewProvider {
    static var previews: some View {
        MysongView(songList: SongList())
            .environmentObject(UserManager())
            .environmentObject(SongManager())
            .environmentObject(SongListManager())
    }
}
