//
//  TeamsSearch.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import Foundation

struct TeamsSearch: Decodable {
    var status: String?
    var region: String?
    var size: Int?
    var pagination: Pagination?
    var data: [TeamsData] = [TeamsData]()
}

struct Pagination: Decodable {
    var page: Int?
    var limit: String?
    var totalElements: Int?
    var totalPages: Int?
    var hasNextPage: Bool?
}

struct TeamsData: Decodable, Identifiable {
    var id: String?
    var url: String?
    var name: String?
    var img: String?
    var country: String?
}
