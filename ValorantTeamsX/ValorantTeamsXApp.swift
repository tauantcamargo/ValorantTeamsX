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
    @AppStorage("hasOnboard") var hasOnboard = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(teamsViewModel)
                .fullScreenCover(isPresented: $hasOnboard) {
                    hasOnboard = false
                } content: {
                        OnboardView()
                }
                .onAppear {
                    teamsViewModel.getTeams(region: nil, limit: 50)
                }
        }
    }
}
