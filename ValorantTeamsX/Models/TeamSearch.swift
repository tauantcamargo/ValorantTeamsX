//
//  TeamSearch.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import Foundation

struct TeamSearch: Decodable {
    var status: String?
    var data: TeamData?
}

struct TeamData: Decodable {
    var info: TeamInfo?
    var players: [PlayersData] = [PlayersData]()
    var staf: [StaffsData] = [StaffsData]()
    var inactive: [String] = [String]()
    var events: [EventsData] = [EventsData]()
    var results: [ResultsData] = [ResultsData]()
    var upcoming: [UpcomingData] = [UpcomingData]()
}

struct TeamInfo: Decodable {
    var name: String?
    var tag: String?
    var logo: String?
}

struct PlayersData: Decodable, Identifiable {
    var id: String?
    var url: String?
    var user: String?
    var name: String?
    var img: String?
    var country: String?
}

struct StaffsData: Decodable, Identifiable {
    var id: String?
    var url: String?
    var user: String?
    var name: String?
    var tag: String?
    var img: String?
    var country: String?
}

struct EventsData: Decodable, Identifiable {
    var id: String?
    var url: String?
    var name: String?
    var results: [String] = [String]()
    var year: String?
}

struct ResultsData: Decodable {
    var match: Match?
    var event: Event?
    var teams: [ResultsTeamsData] = [ResultsTeamsData]()
}

struct Match: Decodable, Identifiable {
    var id: String?
    var url: String?
}

struct Event: Decodable {
    var name: String?
    var logo: String?
}

struct ResultsTeamsData: Decodable {
    var name: String?
    var tag: String?
    var logo: String?
    var points: String?
}

struct UpcomingData: Decodable {
    var match: Match?
    var event: Event?
    var teams: [ResultsTeamsData] = [ResultsTeamsData]()
}
