//
//  TeamSearch.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import Foundation

struct TeamSearch: Decodable {
    var status: String?
    var region: String?
    var size: Int?
    var pagination: Pagination
    var data: [TeamData] = [TeamData]()
}

struct Pagination: Decodable {
    var page: Int?
    var limt: String?
    var totalElements: Int?
    var totalPages: Int?
    var hasNextPage: Bool?
}

struct TeamData: Decodable, Identifiable {
    var id: String?
    var url: String?
    var name: String?
    var img: String?
    var country: String?
}
