//
//  SongListManager.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/14.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreGraphics

class SongListManager: ObservableObject {
    @Published var songLists: [SongList] = []
    @Published var youtubeList: [YoutubeSong] = [] //內容變更時需要重新載入的參數

    init() {
        GetSongLists()
        FetchYoutubeList()
    }
    
    func GetSongLists() {
        songLists.removeAll()
        
        let db = Firestore.firestore()
        db.collection("songlists").order(by: "name").getDocuments { snapshot, error in
            guard let snapshot else { return }
            self.songLists = snapshot.documents.compactMap({ snapshot in
                try? snapshot.data(as: SongList.self)
            })
        }
    }
    
    func AddSongList(list: SongList) {
        
        let db = Firestore.firestore()
        var newList = list
        
        do {
            let documentReference = try db.collection("songlists").addDocument(from: newList)
            print(documentReference.documentID)
            
            self.GetSongLists()
        } catch {
            print(error)
        }
    }
    
    func FetchYoutubeList() {
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
                        var newVideos: [YoutubeSong] = []
                        for item in searchResponse.items {
                            let newVideo = YoutubeSong(title: item.snippet.title,
                                                 thumbnailUrl: item.snippet.thumbnails.standard.url,
                                                 videoId: item.snippet.resourceId.videoId)
                            newVideos += [newVideo]
                        }
                        DispatchQueue.main.async {
                            self.youtubeList = newVideos
                            print(searchResponse.items)
                        }
                    } catch {
                        if let decodingError = error as? DecodingError {
                            print("ERROR: \(decodingError.self)")
                        }
                        fatalError("decode error")
                    }
                }
            }.resume()
        }
    }

    
}

struct SongList: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String = "SongList"
    var songs: [String] = []
    var item: String = "ColorFigure01"
    var offset_x: Float = 110.0
    var offset_y: Float = 80.0
    var youtube_id: String = ""
    
}

struct YoutubeSong: Codable, Identifiable {
//    @DocumentID var id: String?
    var id = UUID()
    var title: String //影片標題
    var thumbnailUrl: URL //縮圖
    var videoId: String
}

enum CircleItem: String, CaseIterable {
    case item_one = "ColorFigure01"
    case item_two = "ColorFigure02"
    case item_three = "ColorFigure03"
    case item_four = "ColorFigure04"
    case item_five = "ColorFigure05"
    case item_six = "ColorFigure06"
    
    func offset() -> CGPoint {
        switch self {
        case .item_one: return CGPoint(x: 0.0, y: 140.0)
        case .item_two: return CGPoint(x: 110.0, y: -80.0)
        case .item_three: return CGPoint(x: 0.0, y: -150.0)
        case .item_four: return CGPoint(x: 110.0, y: 80.0)
        case .item_five: return CGPoint(x: -110.0, y: 80.0)
        case .item_six: return CGPoint(x: -110.0, y: -80.0)
        }
    }
}

struct SearchResponse: Codable {
    let items: [Item]
    
    struct Item: Codable {
        let snippet: Snippet
        
        struct Snippet: Codable {
            let title: String
            let thumbnails: Thumbnail
            let resourceId: ResourceId
            
            struct Thumbnail: Codable {
                let standard: ThumbnailImage
                
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

