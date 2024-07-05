//
//  SwiftUIView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct OnboardDetailView: View {
    var color: Color
    var title: String
    var subtitle: String?
    var buttonLabel: String?
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(color)
            
            VStack {
                Spacer()
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                
                VStack (spacing: 4) {
                    Text(title)
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .font(Font.system(size: 20))
                        .bold()
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 16))
                            .bold()
                            .foregroundStyle(.indigo)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(height: 50)
                            .shadow(radius: 8, x: 7, y: 7)
                        Text(buttonLabel ?? "Continue")
                            .bold()
                            .foregroundStyle(color)
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardDetailView(color: .mint, title: "Hey Valorant Champion", subtitle: "Are you ready to discover all details about your favorite teams?", buttonLabel: "Of course!", buttonAction: {
        print("Hello")
    } )
}
