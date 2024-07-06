//
//  ContentView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(TeamsViewModel.self) var teamsViewModel
    @State var queryTeam = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for you favorite team...", text: $queryTeam)
                    .textFieldStyle(.roundedBorder)
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.mint)
                        Image(systemName: "magnifyingglass")
                    }
                    .frame(width: 50, height: 35)
                }
            }
            
            List {
                ForEach(teamsViewModel.teams, id: \.id) { team in
                    VStack(spacing: 20) {
                        TeamListItemView(teamData: team)
                        Divider()
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .padding(.top, 80)
        .padding(.horizontal, 10)
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
        .environment(TeamsViewModel())
}
