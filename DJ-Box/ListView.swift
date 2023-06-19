//
//  ListView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/5.
//  Modify by 林寧 on 2023/6/17.

import SwiftUI
import WebKit

struct ListView: View {
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager
    
    @State private var newSongList = SongList()
    @State private var showAlert = false
        
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            
            VStack {
                Title(iconName: "music.note.list",title: "專屬您的歌單")
                
                ScrollView(.vertical) {
                    LazyVStack(spacing: 20) {
//                        ForEach(songListManager.youtubeList, id: \.id) { youtube in
                        ForEach(songManager.recommendSongs, id: \.id) { song in

                            NavigationLink {
                                if let videlID = extractVideoID(from: song.url) {
                                    WKWebViewWrapper(videoID: videlID)
                                } else {
                                    Text(song.title)
                                }
//                                Text(youtube.videoId)
                            } label: {
                                HStack {
//                                    if let url = youtube.thumbnailUrl,
//                                       let imageData = try? Data(contentsOf: url),
//                                       let thumbnailImage = UIImage(data: imageData) {
//                                        Image(uiImage: thumbnailImage)
//                                            .resizable()
//                                            .frame(width: 50, height: 50)
//                                            .cornerRadius(8)
//                                            .padding(.leading, 20)
//                                    }
                                    
                                    Spacer()
                                    Text("\(song.title)")
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
                
                Button(action: {
                    
                    for song in songManager.recommendSongs {
                        newSongList.songs.append(song.id)
                    }
                    
                    let songListsCount = songListManager.songLists.count
                    newSongList.name = "SongList\(songListsCount)"
                    
                    if (songListsCount % 6) == 1 {
                        let circleItem = CircleItem.item_one
                        newSongList.item = circleItem.rawValue
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    } else if (songListsCount % 6) == 2 {
                        let circleItem = CircleItem.item_two
                        newSongList.item = circleItem.rawValue
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    } else if (songListsCount % 6) == 3 {
                        let circleItem = CircleItem.item_three
                        newSongList.item = circleItem.rawValue
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    } else if (songListsCount % 6) == 4 {
                        let circleItem = CircleItem.item_four
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    } else if (songListsCount % 6) == 5 {
                        let circleItem = CircleItem.item_five
                        newSongList.item = circleItem.rawValue
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    } else if (songListsCount % 6) == 0 {
                        let circleItem = CircleItem.item_six
                        newSongList.item = circleItem.rawValue
                        newSongList.offset_x = Float(circleItem.offset().x)
                        newSongList.offset_y = Float(circleItem.offset().y)
                    }
                    
                    songListManager.AddSongList(songlist: newSongList)
                    showAlert = true
                }){
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(Color(red: 42/255, green: 39/255, blue: 71/255))
                        .padding(.leading,10)
                        .scaleEffect(0.9)
                    
                    Text("加入收藏")
                        .font(.headline)
                        .foregroundColor(Color(red: 42/255, green: 39/255, blue: 71/255))
                        .padding(.top,15)
                        .padding(.bottom,15)
                        .padding(.trailing,10)
                }
                .background(djboxGradient)
                .cornerRadius(18)
                .padding(.top, 20)
                .padding(.bottom, 50)
                .alert("收藏成功", isPresented: $showAlert, actions: {
                    Button("OK") {
                        // Init
                        newSongList = SongList()
                    }
                })
            }
                
        }
    }
}

struct WKWebViewWrapper: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(videoID)") {
            let request = URLRequest(url: youtubeURL)
            webView.load(request)
        } else {
            fatalError("ERROR: can't play youtube.")
        }


//        guard let videoURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
//        let request = URLRequest(url: videoURL)
//        webView.load(request)
    }
}

func extractVideoID(from url: String) -> String? {
    if let query = URLComponents(string: url)?.queryItems {
        for item in query {
            if item.name.lowercased() == "v" {
                return item.value
            }
        }
    }
    
    return nil
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(SongManager())
            .environmentObject(SongListManager())
    }
}
