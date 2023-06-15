//
//  VideoModel.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/12.
//

import Foundation

struct Video: Hashable,Codable{
    let id = UUID()
    let title: String //影片標題
    let thumbnailUrl: URL //縮圖
    let videoId: String
    var isFavorite: Bool = false //收藏
}


class VideoModel: ObservableObject {
    @Published var videos: [Video] = [] //內容變更時需要重新載入的參數
    
    func fetchData() {
        //取得影片基本資訊用snippet
        let playlistId = "PLNhzyV4NWnWPg906ZXTcB8zekuhkTxswK" //播放清單id
        let apiKey = "AIzaSyDsm2lYoq1qH7DQZdSDMeboOuKmck_w-r0"

        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=PLNhzyV4NWnWPg906ZXTcB8zekuhkTxswK&key=AIzaSyDsm2lYoq1qH7DQZdSDMeboOuKmck_w-r0&maxResults=30"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                        var newVideos: [Video] = []
                        for item in searchResponse.items {
                            let newVideo = Video(title: item.snippet.title,
                                                 thumbnailUrl: item.snippet.thumbnails.standard.url,
                                                 videoId: item.snippet.resourceId.videoId)
                            newVideos += [newVideo]
                        }
                        DispatchQueue.main.async {
                            self.videos = newVideos
                            print(searchResponse.items)
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }

}

struct SearchResponse: Codable {
    let items: [Item]
    let nextPageToken: String
    
    struct Item: Codable {
        let snippet: Snippet
        
        struct Snippet: Codable {
            let title: String
            let thumbnails: Thumbnail
            let resourceId: ResourceId
            
            struct Thumbnail: Codable {
                let standard: ThumbnailImage
                let maxres: ThumbnailImage
                
                struct ThumbnailImage: Codable {
                    let url: URL
                }
            }
            
            struct ResourceId: Codable {
                let videoId: String
            }
        }
    }
}
