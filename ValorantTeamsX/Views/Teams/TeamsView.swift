//
//  TeamsView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct TeamsView: View {
    @Environment(TeamsViewModel.self) var teamsViewModel
    @State var regionSelected = "all"
    @State var showFilterLimit = false
    @State var selectedLimit = 10
    @State var showFilter = false
    
    var body: some View {
        @Bindable var teamsViewModel = teamsViewModel
       
        
        VStack(spacing: 20) {
            VStack {
                Toggle("Show filters", isOn: $showFilter)
            }
            
            if showFilter {
                VStack(spacing: 20) {
                    HStack {
                        Text("Region?")
                        Spacer()
                        Picker("Category", selection: $regionSelected) {
                            Text("Europe")
                                .tag("europe")
                            Text("Brazil")
                                .tag("brazil")
                            Text("All")
                                .tag("all")
                        }
                    }
                    Toggle("Want to change teams count?", isOn: $showFilterLimit)
                    if showFilterLimit {
                        HStack {
                            Text("How much teams?")
                            Spacer()
                            Picker("Category", selection: $selectedLimit) {
                                Text("10")
                                    .tag(10)
                                Text("20")
                                    .tag(20)
                                Text("30")
                                    .tag(30)
                                Text("40")
                                    .tag(40)
                                Text("50")
                                    .tag(50)
                            }
                        }
                    }
                    
                    Button {
                        teamsViewModel.getTeams(region: regionSelected, limit: selectedLimit)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(height: 50)
                                .shadow(radius: 8, x: 7, y: 7)
                            Text("search")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .transition(.push(from: .top))
            }
            
            if teamsViewModel.teams.isEmpty {
                VStack {
                    Spacer()
                    Text("Sorry no teams found :(")
                    Spacer()
                }
            } else {
                List {
                    ForEach(teamsViewModel.teams, id: \.id) { team in
                        VStack(spacing: 20) {
                            TeamListItemView(teamData: team)
                            Divider()
                        }
                        .onTapGesture {
                            withAnimation {
                                teamsViewModel.teamSelected = team
                                teamsViewModel.team = nil
                                showFilter = false
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .padding(.vertical, 80)
        .padding(.horizontal, 10)
        .ignoresSafeArea()
        .sheet(item: $teamsViewModel.teamSelected) { team in
            TeamDetailView()
        }
    }
}

#Preview {
    TeamsView()
        .environment(TeamsViewModel())
}
