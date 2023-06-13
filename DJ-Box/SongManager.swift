//
//  Song.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/7.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreML

class SongManager: ObservableObject {
    @Published var recommendSongs: [Song] = []
    @Published var songDataList: [SongData] = []
    
    init() {
        GetSongData()
    }
    
    func GetSongData() {
        songDataList.removeAll()
        
        let db = Firestore.firestore()
        db.collection("songs").order(by: "title").getDocuments { snapshot, error in
            guard let snapshot else { return }
            self.songDataList = snapshot.documents.compactMap({ snapshot in
                try? snapshot.data(as: SongData.self)
            })
        }
    }
    
    func FilterSongs(occasion: Occasion, mood: Mood, duration: Int) {
        print(occasion.rawValue)
        print(mood.rawValue)
        
        // 載入Mood CoreML模型
        let moodModel = MoodCNNClassifier()
        let occasionModel = OccasionCNNClassifier()
        
        // 創建輸入資料
        guard let tensorInput = try? MLMultiArray(shape: [1, 40], dataType: .float32) else {
            fatalError("Could not create tensorInput")
        }
        
        for song in songDataList {
            tensorInput[0] = NSNumber(value: Float32(song.centroid_mean))
            tensorInput[1] = NSNumber(value: Float32(song.roloff_mean))
            tensorInput[2] = NSNumber(value: Float32(song.flux_mean))
            tensorInput[3] = NSNumber(value: Float32(song.rmse_mean))
            tensorInput[4] = NSNumber(value: Float32(song.zcr_mean))
            tensorInput[5] = NSNumber(value: Float32(song.bandwidth_mean))
            tensorInput[6] = NSNumber(value: Float32(song.flatness_mean))
            tensorInput[7] = NSNumber(value: Float32(song.mels_0_mean))
            tensorInput[8] = NSNumber(value: Float32(song.mels_1_mean))
            tensorInput[9] = NSNumber(value: Float32(song.mels_2_mean))
            tensorInput[10] = NSNumber(value: Float32(song.mels_3_mean))
            tensorInput[11] = NSNumber(value: Float32(song.mels_4_mean))
            tensorInput[12] = NSNumber(value: Float32(song.mels_5_mean))
            tensorInput[13] = NSNumber(value: Float32(song.mels_6_mean))
            tensorInput[14] = NSNumber(value: Float32(song.mels_7_mean))
            tensorInput[15] = NSNumber(value: Float32(song.mels_8_mean))
            tensorInput[16] = NSNumber(value: Float32(song.mels_9_mean))
            tensorInput[17] = NSNumber(value: Float32(song.mels_10_mean))
            tensorInput[18] = NSNumber(value: Float32(song.mels_11_mean))
            tensorInput[19] = NSNumber(value: Float32(song.mels_12_mean))
            tensorInput[20] = NSNumber(value: Float32(song.mels_13_mean))
            tensorInput[21] = NSNumber(value: Float32(song.mels_14_mean))
            tensorInput[22] = NSNumber(value: Float32(song.mels_15_mean))
            tensorInput[23] = NSNumber(value: Float32(song.mels_16_mean))
            tensorInput[24] = NSNumber(value: Float32(song.mels_17_mean))
            tensorInput[25] = NSNumber(value: Float32(song.mels_18_mean))
            tensorInput[26] = NSNumber(value: Float32(song.mels_19_mean))
            tensorInput[27] = NSNumber(value: Float32(song.chroma_0_mean))
            tensorInput[28] = NSNumber(value: Float32(song.chroma_1_mean))
            tensorInput[29] = NSNumber(value: Float32(song.chroma_2_mean))
            tensorInput[30] = NSNumber(value: Float32(song.chroma_3_mean))
            tensorInput[31] = NSNumber(value: Float32(song.chroma_4_mean))
            tensorInput[32] = NSNumber(value: Float32(song.chroma_5_mean))
            tensorInput[33] = NSNumber(value: Float32(song.chroma_6_mean))
            tensorInput[34] = NSNumber(value: Float32(song.chroma_7_mean))
            tensorInput[35] = NSNumber(value: Float32(song.chroma_8_mean))
            tensorInput[36] = NSNumber(value: Float32(song.chroma_9_mean))
            tensorInput[37] = NSNumber(value: Float32(song.chroma_10_mean))
            tensorInput[38] = NSNumber(value: Float32(song.chroma_11_mean))
            tensorInput[39] = NSNumber(value: Float32(0)) // label
            
            // 進行場合預測
            do {
                //
            }
            // 進行情緒預測
            do {
                let prediction = try moodModel.prediction(flatten_1_input: tensorInput)
//                    print(tensorInput)
//                    print(prediction.Identity[0].floatValue)
//                    print(prediction.Identity[1].floatValue)
//                    print(prediction.Identity[2].floatValue)
                print(prediction.Identity[3].floatValue)

                if prediction.Identity[mood.identity()].floatValue > 0.5 {
                    self.recommendSongs.append(Song(title: song.title, duration: song.duration, url: song.url))
                        // return 1
                }
                else {
                        // return 0
                }
            } catch {
                fatalError("Failed to make prediction with Mood model")
            }
        }
            
//            // 從歌曲列表中挑選符合時長的歌曲
//            var totalDuration = 0
//
//            // 還要再修改
//            while totalDuration < duration && !songList.isEmpty {
//                let randomIndex = Int.random(in: 0..<songList.count)
//                let song = songList[randomIndex]
//
//                if totalDuration + song.duration <= duration {
//                    self.recommendSongs.append(song)
//                    totalDuration += song.duration
//                }
//
//                // 從歌曲列表中移除已選擇的歌曲
//                songList.remove(at: randomIndex)
//             }
        print("Finish geralize recommend song list.")
        print(self.recommendSongs)
    }
    
}

struct Song:Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let duration: Int
    let url: String
}

struct SongData: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let duration: Int
    let url: String
    let field1: Int
    let bandwidth_mean: Float
    let centroid_mean: Float
    let flatness_mean: Float
    let flux_mean: Float
    let rmse_mean: Float
    let roloff_mean: Float
    let zcr_mean: Float
    let chroma_0_mean: Float
    let chroma_1_mean: Float
    let chroma_2_mean: Float
    let chroma_3_mean: Float
    let chroma_4_mean: Float
    let chroma_5_mean: Float
    let chroma_6_mean: Float
    let chroma_7_mean: Float
    let chroma_8_mean: Float
    let chroma_9_mean: Float
    let chroma_10_mean: Float
    let chroma_11_mean: Float
    let mels_0_mean: Float
    let mels_1_mean: Float
    let mels_2_mean: Float
    let mels_3_mean: Float
    let mels_4_mean: Float
    let mels_5_mean: Float
    let mels_6_mean: Float
    let mels_7_mean: Float
    let mels_8_mean: Float
    let mels_9_mean: Float
    let mels_10_mean: Float
    let mels_11_mean: Float
    let mels_12_mean: Float
    let mels_13_mean: Float
    let mels_14_mean: Float
    let mels_15_mean: Float
    let mels_16_mean: Float
    let mels_17_mean: Float
    let mels_18_mean: Float
    let mels_19_mean: Float
}

//['awards' 'coffee' 'company' 'gathering' 'graduation' 'seminar' 'sports' 'wedding']
enum Occasion: String, CaseIterable {
    case awards = "awards"
    case coffee = "coffee"
    case company = "company"
    case wedding = "wedding"
    case gathering = "gathering"
    case graduation = "graduation"
    case seminar = "seminar"
    case sports = "sports"
    
    func text() -> String {
        switch self {
        case .awards: return "頒獎典禮"
        case .coffee: return "咖啡廳"
        case .company: return "公司活動"
        case .wedding: return "婚禮"
        case .gathering: return "聚會"
        case .graduation: return "畢業典禮"
        case .seminar: return "講座"
        case .sports: return "運動會"

        }
    }
    
    func identity() -> Int {
        switch self {
        case .awards: return 0
        case .coffee: return 1
        case .company: return 2
        case .wedding: return 3
        case .gathering: return 4
        case .graduation: return 5
        case .seminar: return 6
        case .sports: return 7

        }
    }
}

enum Mood: String, CaseIterable {
    case energetic = "energetic"
    case happy = "happy"
    case calm = "calm"
    case sad = "sad"
    
    func text() -> String {
        switch self{
        case .energetic: return "活力"
        case .happy: return "開心"
        case .calm: return "平靜"
        case .sad: return "悲傷"
        }
    }
    
    func identity() -> Int {
        switch self{
        case .energetic: return 0
        case .happy: return 1
        case .calm: return 2
        case .sad: return 3
        }
    }
}
