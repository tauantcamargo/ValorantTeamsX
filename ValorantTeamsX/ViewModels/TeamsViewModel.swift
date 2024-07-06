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
    
    func getTeams() {
        Task {
            teams = await teamsDataService.teamsSearch()
        }
    }
}
