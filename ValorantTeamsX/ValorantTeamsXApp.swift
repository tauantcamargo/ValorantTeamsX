//
//  ValorantTeamsXApp.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

@main
struct ValorantTeamsXApp: App {
    @State var teamsViewModel = TeamsViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(teamsViewModel)
                .onAppear {
                    teamsViewModel.getTeams()
                }
        }
    }
}
