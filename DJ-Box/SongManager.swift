//
//  Song.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/7.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import CoreML

class SongManager: ObservableObject {
    @Published var songDataList: [SongData] = []
    @Published var recommendSongs: [Song] = []
    
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
//            self.songDataList = self.songDataList.sorted{ $0.duration > $1.duration }
            self.songDataList.shuffle()
        }
    }
    
    func FilterSongs(occasion: Occasion, mood: Mood, duration: Int) {
        print(occasion.rawValue)
        print(mood.rawValue)
        print(duration)
        
        var closetDifference = duration
        var closetDuration = 0
        
        // 創建輸入資料
        guard let tensorInput = try? MLMultiArray(shape: [1, 40], dataType: .float32) else {
            fatalError("Could not create tensorInput")
        }
        
        for song in self.songDataList {
            tensorInput[0] = NSNumber(value: Float32(Float(song.centroid_mean) ?? 0.0))
            tensorInput[1] = NSNumber(value: Float32(Float(song.roloff_mean) ?? 0.0))
            tensorInput[2] = NSNumber(value: Float32(Float(song.flux_mean) ?? 0.0))
            tensorInput[3] = NSNumber(value: Float32(Float(song.rmse_mean) ?? 0.0))
            tensorInput[4] = NSNumber(value: Float32(Float(song.zcr_mean) ?? 0.0))
            tensorInput[5] = NSNumber(value: Float32(Float(song.bandwidth_mean) ?? 0.0))
            tensorInput[6] = NSNumber(value: Float32(Float(song.flatness_mean) ?? 0.0))
            tensorInput[7] = NSNumber(value: Float32(Float(song.mels_0_mean) ?? 0.0))
            tensorInput[8] = NSNumber(value: Float32(Float(song.mels_1_mean) ?? 0.0))
            tensorInput[9] = NSNumber(value: Float32(Float(song.mels_2_mean) ?? 0.0))
            tensorInput[10] = NSNumber(value: Float32(Float(song.mels_3_mean) ?? 0.0))
            tensorInput[11] = NSNumber(value: Float32(Float(song.mels_4_mean) ?? 0.0))
            tensorInput[12] = NSNumber(value: Float32(Float(song.mels_5_mean) ?? 0.0))
            tensorInput[13] = NSNumber(value: Float32(Float(song.mels_6_mean) ?? 0.0))
            tensorInput[14] = NSNumber(value: Float32(Float(song.mels_7_mean) ?? 0.0))
            tensorInput[15] = NSNumber(value: Float32(Float(song.mels_8_mean) ?? 0.0))
            tensorInput[16] = NSNumber(value: Float32(Float(song.mels_9_mean) ?? 0.0))
            tensorInput[17] = NSNumber(value: Float32(Float(song.mels_10_mean) ?? 0.0))
            tensorInput[18] = NSNumber(value: Float32(Float(song.mels_11_mean) ?? 0.0))
            tensorInput[19] = NSNumber(value: Float32(Float(song.mels_12_mean) ?? 0.0))
            tensorInput[20] = NSNumber(value: Float32(Float(song.mels_13_mean) ?? 0.0))
            tensorInput[21] = NSNumber(value: Float32(Float(song.mels_14_mean) ?? 0.0))
            tensorInput[22] = NSNumber(value: Float32(Float(song.mels_15_mean) ?? 0.0))
            tensorInput[23] = NSNumber(value: Float32(Float(song.mels_16_mean) ?? 0.0))
            tensorInput[24] = NSNumber(value: Float32(Float(song.mels_17_mean) ?? 0.0))
            tensorInput[25] = NSNumber(value: Float32(Float(song.mels_18_mean) ?? 0.0))
            tensorInput[26] = NSNumber(value: Float32(Float(song.mels_19_mean) ?? 0.0))
            tensorInput[27] = NSNumber(value: Float32(Float(song.chroma_0_mean) ?? 0.0))
            tensorInput[28] = NSNumber(value: Float32(Float(song.chroma_1_mean) ?? 0.0))
            tensorInput[29] = NSNumber(value: Float32(Float(song.chroma_2_mean) ?? 0.0))
            tensorInput[30] = NSNumber(value: Float32(Float(song.chroma_3_mean) ?? 0.0))
            tensorInput[31] = NSNumber(value: Float32(Float(song.chroma_4_mean) ?? 0.0))
            tensorInput[32] = NSNumber(value: Float32(Float(song.chroma_5_mean) ?? 0.0))
            tensorInput[33] = NSNumber(value: Float32(Float(song.chroma_6_mean) ?? 0.0))
            tensorInput[34] = NSNumber(value: Float32(Float(song.chroma_7_mean) ?? 0.0))
            tensorInput[35] = NSNumber(value: Float32(Float(song.chroma_8_mean) ?? 0.0))
            tensorInput[36] = NSNumber(value: Float32(Float(song.chroma_9_mean) ?? 0.0))
            tensorInput[37] = NSNumber(value: Float32(Float(song.chroma_10_mean) ?? 0.0))
            tensorInput[38] = NSNumber(value: Float32(Float(song.chroma_11_mean) ?? 0.0))
            tensorInput[39] = NSNumber(value: Float32(0)) // label
            
            // 篩選出符合 occasion condition 的 song
            if let occasionPrediction = ClassifyOccasion(tensorInput) {
                if occasionPrediction.Identity[occasion.identity()].floatValue > 0.5 {
                    print("occasion > \(song.title):\(occasionPrediction.Identity[occasion.identity()].floatValue)")
                    
                    // 篩選出符合 mood condition 的 song
                    if let moodPrediction = ClassifyMood(tensorInput) {
                        if moodPrediction.Identity[mood.identity()].floatValue > 0.5 {
                            print("mood > \(song.title):\(moodPrediction.Identity[mood.identity()].floatValue)")
                            
                            // 找出最貼近 duration 的 song
                            if let songDuration = Int(song.duration) {
                                if songDuration < duration {
                                    let difference = (duration - songDuration)
                                    print("Difference: \(difference)")
                                    
                                    if difference < closetDifference {
                                        recommendSongs.append(Song(title: song.title, duration: Int(song.duration) ?? 0, url: song.url))
                                        closetDifference = difference
                                        closetDuration += Int(song.duration) ?? 0
                                        print("Closet Duration: \(closetDuration)")
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        print("Finish geralize recommend song list.")
        print("Closet Duration: \(closetDuration)")
        print("Recommend Song List: \(self.recommendSongs)")
    }
    
    func ClassifyMood(_ input: MLMultiArray) -> MoodCNNClassifierOutput? {
        
        do {
            let moodModel = MoodCNNClassifier()
            let prediction = try moodModel.prediction(flatten_1_input: input)
            return prediction
        } catch {
            fatalError("ERROR: Mood Model failed to predict.")
        }
    }
    
    func ClassifyOccasion(_ input: MLMultiArray) -> OccasionCNNClassifierOutput? {
        
        do {
            let occasionModel = OccasionCNNClassifier()
            let prediction = try occasionModel.prediction(flatten_13_input: input)
            return prediction
        } catch {
            fatalError("ERROR: Occasion Model failed to predict.")
        }
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
    let duration: String
    let url: String
    let field1: String
    let bandwidth_mean: String
    let centroid_mean: String
    let flatness_mean: String
    let flux_mean: String
    let rmse_mean: String
    let roloff_mean: String
    let zcr_mean: String
    let chroma_0_mean: String
    let chroma_1_mean: String
    let chroma_2_mean: String
    let chroma_3_mean: String
    let chroma_4_mean: String
    let chroma_5_mean: String
    let chroma_6_mean: String
    let chroma_7_mean: String
    let chroma_8_mean: String
    let chroma_9_mean: String
    let chroma_10_mean: String
    let chroma_11_mean: String
    let mels_0_mean: String
    let mels_1_mean: String
    let mels_2_mean: String
    let mels_3_mean: String
    let mels_4_mean: String
    let mels_5_mean: String
    let mels_6_mean: String
    let mels_7_mean: String
    let mels_8_mean: String
    let mels_9_mean: String
    let mels_10_mean: String
    let mels_11_mean: String
    let mels_12_mean: String
    let mels_13_mean: String
    let mels_14_mean: String
    let mels_15_mean: String
    let mels_16_mean: String
    let mels_17_mean: String
    let mels_18_mean: String
    let mels_19_mean: String
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
