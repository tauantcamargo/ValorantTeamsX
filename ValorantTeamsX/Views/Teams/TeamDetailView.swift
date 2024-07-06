//
//  TeamDetailView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct TeamDetailView: View {
    @Environment(TeamsViewModel.self) var teamsViewModel
    
    var body: some View {
        let teamSelected = teamsViewModel.teamSelected
        
        VStack {
            Text(teamsViewModel.team?.info?.tag ?? "TAG")
        }
        .onAppear {
            teamsViewModel.getTeamById(id: teamSelected?.id ?? "")
        }
    }
}

#Preview {
    TeamDetailView()
        .environment(TeamsViewModel())
}
