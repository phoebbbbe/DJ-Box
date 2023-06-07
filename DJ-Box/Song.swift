//
//  Song.swift
//  DJ-Box
//
//  Created by 林寧 on 2023/6/7.
//

import Foundation
import FirebaseFirestoreSwift

struct Song: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let duration: Int
    let url: String
    let occasion: String
    let mood: String
}
