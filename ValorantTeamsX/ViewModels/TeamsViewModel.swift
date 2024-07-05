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
    
    func getTeams() {
        Task {
            await teamsDataService.teamsSearch()
        }
    }
}
