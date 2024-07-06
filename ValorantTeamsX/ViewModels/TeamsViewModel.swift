//
//  TeamsViewModel.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import Foundation
import SwiftUI

@Observable
class TeamsViewModel {
    var teamsDataService = TeamsDataService()
    
    var teams: [TeamsData] = [TeamsData]()
    var teamSelected: TeamsData?
    
    var team: TeamData?
    
    func getTeams(region: String?, limit: Int?) {
        Task {
            teams = await teamsDataService.teamsSearch(region: region, limit: limit)
        }
    }
    
    func getTeamById(id: String) {
        Task {
            team = await teamsDataService.teamSearch(id: id)
        }
    }
}
