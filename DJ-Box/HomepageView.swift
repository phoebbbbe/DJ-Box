//
//  HomepageView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//  Modify by 林寧 on 2023/6/14.

import SwiftUI

struct HomepageView: View {
    @EnvironmentObject var songListManager: SongListManager
    
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
               .ignoresSafeArea()
            VStack {
                Title(iconName: "music.note",title: "Create Playlist")
                    .offset(x:0, y:-180)
                ZStack {
                    ForEach(songListManager.songLists) { list in
                        SongListItem(listItem: list)
                            .offset(x: CGFloat(list.offset_x), y: CGFloat(list.offset_y))
                    }
                }
                
                // Search Button
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                   Color(red: 0.66, green: 0.96, blue: 0.71),
                                   Color(red: 0.80, green: 0.97, blue: 0.52),
                                   Color(red: 0.84, green: 0.98, blue: 0.47),
                                   Color(red: 0.66, green: 0.96, blue: 0.71)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 130, height: 130)
                        .shadow(color: .white, radius: 10, x: 0, y: 0)
                    
                    Image(systemName: "waveform")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(red: 0.18, green: 0.17, blue: 0.35))
                        .shadow(color: .white, radius: 10, x: 0, y: 0)
                    
                }
                .offset(x: 0, y: -50)
            }
            
            
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
            .environmentObject(SongListManager())
    }
}
