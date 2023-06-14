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
    
    init() {
        GetSongLists()
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
    
}

struct SongList: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String = "SongList"
    var songs: [String] = []
    var item: String = "ColorFigure01"
    var offset_x: Float = 110.0
    var offset_y: Float = 80.0
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
