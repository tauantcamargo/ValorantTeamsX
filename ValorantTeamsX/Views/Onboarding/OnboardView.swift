//
//  OnboardView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct OnboardView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedView = 0
    
    var body: some View {
        ZStack {
            Color(
                getBgColor(index: selectedView)
            )
            
            TabView(selection: $selectedView) {
                OnboardDetailView(
                    color: .mint,
                    title: "Hey Valorant Friend",
                    subtitle: "Are you ready to discover everything about your favorite teams?",
                    buttonLabel: "Yes i am!",
                    buttonAction: {
                        withAnimation {
                            selectedView = 1
                        }
                    }
                )
                .tag(0)
                
                OnboardDetailView(
                    color: .indigo,
                    title: "Sooo many things",
                    subtitle: "Are you ready to discover everything about your favorite team players?",
                    buttonLabel: "Yes i am!",
                    buttonAction: {
                        withAnimation {
                            selectedView = 2
                        }
                    }
                )
                .tag(1)
                
                OnboardDetailView(
                    color: .pink,
                    title: "Let's Rock it?",
                    buttonLabel: "F*ck yeah!",
                    buttonAction: {
                        withAnimation {
                            dismiss()
                        }
                    }
                )
                .tag(2)
            }
            .tabViewStyle(.page)
        }
        .ignoresSafeArea()
    }
    
    private func getBgColor(index: Int) -> Color {
        switch index {
        case 0:
            return .mint
        case 1:
            return .indigo
        case 2:
            return .pink
        default:
            return .orange
        }
    }
}

#Preview {
    OnboardView()
        .environment(TeamsViewModel())
}
