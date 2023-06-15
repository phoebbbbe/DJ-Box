//
//  ListView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/5.
//


import SwiftUI

struct ListView: View {
    @StateObject var videoModel = VideoModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(videoModel.videos,id: \.id){ video in
                    
                    //List(selection: videoModel.videos ) { video in
                    HStack {
                        if let url = video.thumbnailUrl,
                           let imageData = try? Data(contentsOf: url),
                           let thumbnailImage = UIImage(data: imageData) {
                            Image(uiImage: thumbnailImage)
                                .resizable()
                                .frame(width: 130, height: 70)
                                //.background(Color.gray)
                        }
                        Text(video.title)
                            .bold()
                        //ListCellView(video : $video)
                    }
                    .padding(3)
                }
                .navigationBarTitle("專屬您的歌單")
                .onAppear {
                    videoModel.fetchData()
                    //print(videoModel.fetchData())
                }
            }
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
