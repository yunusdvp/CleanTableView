//
//  PostModel.swift
//  CleanJsonPlaceTableView
//
//  Created by Yunus Emre ÖZŞAHİN on 14.05.2024.
//

import Foundation

struct PostModel: Decodable {
    
    let userID, id: Int?
    let title, body: String?
}
