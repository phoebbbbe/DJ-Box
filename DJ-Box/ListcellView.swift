//
//  ListcellView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/15.
//

import SwiftUI

struct ListCellView: View {
    @Binding var video: Video
    
    var body: some View {
        HStack {
            if let url = video.thumbnailUrl,
               let imageData = try? Data(contentsOf: url),
               let thumbnailImage = UIImage(data: imageData) {
                Image(uiImage: thumbnailImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(6)
            }
            
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.headline)
                    .lineLimit(2)
            }
            
            Button(action: {
                video.isFavorite = true
            }) {
                Image(systemName: video.isFavorite ? "heart.fill" : "heart")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}


struct ListcellView_Previews: PreviewProvider {
    static var previews: some View {
        let video = Video(title: "影片標題",
                                  thumbnailUrl: URL(string: "https://example.com/thumbnail.jpg")!,
                                  videoId: "exampleVideoId")
                let videoBinding = Binding<Video>(get: { video }, set: { _ in })

                return ListCellView(video: videoBinding)
    }
}
