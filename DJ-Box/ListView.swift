//
//  ListView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/5.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager
    
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            
            VStack {
                Text("專屬您的歌單")
                    .bold()
                    .font(.system(size: 33))
                    .foregroundColor(.white)
                    .padding(.bottom, 70)
                    .offset(x: 0, y: -250)
                
                ScrollView(.vertical) {
                    LazyVStack(spacing: 20) {
                        ForEach(songListManager.youtubeList, id: \.id) { youtube in
                            NavigationLink(destination: Text("\(youtube.title)")
                                .foregroundColor(.black)
                            ) {
                                HStack {
                                    if let url = youtube.thumbnailUrl,
                                       let imageData = try? Data(contentsOf: url),
                                       let thumbnailImage = UIImage(data: imageData) {
                                        Image(uiImage: thumbnailImage)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                            .padding(.leading,20)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(youtube.title)")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                            
                            Divider()
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(SongManager())
            .environmentObject(SongListManager())
    }
}
