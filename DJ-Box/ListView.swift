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
                    .padding(.top, 50)
                    .padding(.bottom, 50)
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
                                            .padding(.leading, 20)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(youtube.title)")
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
                    //加入收藏
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
