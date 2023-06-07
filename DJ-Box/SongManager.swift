//
//  Song.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/7.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class SongManager: ObservableObject{
    @Published var personalizedSongs: [Song] = []
    
    func generateSongList(occasion: String, mood: String, duration: Int) {
        let db = Firestore.firestore()
        let songsCollection = db.collection("songs")
        
        print("場合：\(occasion)")
        print("情緒：\(mood)")
        print("時長：\(duration)")
        
        // 創建一個空的歌曲列表
        var songList: [Song] = []
        
        songsCollection.whereField("occasion", isEqualTo: occasion)
            .whereField("mood", isEqualTo: mood)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error loading songs: \(error.localizedDescription)")
                    return
                }

                
                guard let querySnapshot else { return }
                songList = querySnapshot.documents.compactMap { snapshot in
                    try? snapshot.data(as: Song.self)
                }
                
                // 從歌曲列表中挑選符合時長的歌曲
                var totalDuration = 0
                
                // 還要再修改
                while totalDuration < duration && !songList.isEmpty {
                    let randomIndex = Int.random(in: 0..<songList.count)
                    let song = songList[randomIndex]
                    
                    if totalDuration + song.duration <= duration {
                        self.personalizedSongs.append(song)
                        totalDuration += song.duration
                    }
                    
                    // 從歌曲列表中移除已選擇的歌曲
                    songList.remove(at: randomIndex)
                }
                print("Finish geralize song list.")
                print(self.personalizedSongs)
            }
    }
}

struct Song: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let duration: Int
    let url: String
    let occasion: String
    let mood: String
}
