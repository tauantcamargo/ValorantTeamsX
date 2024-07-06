//
//  ContentView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(TeamsViewModel.self) var teamsViewModel
    
    var body: some View {
        TabView {
            TeamsView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.3.fill")
                        Text("Teams")
                    }
                    .foregroundStyle(.mint)
                }
            
            PlayersView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.badge.shield.checkmark")
                        Text("Players")
                    }
                    .foregroundStyle(.mint)
                }
        }
        .accentColor(.mint)
    }
}

#Preview {
    HomeView()
        .environment(TeamsViewModel())
}
