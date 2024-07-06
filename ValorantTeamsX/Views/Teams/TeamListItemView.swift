//
//  TeamListItemView.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import SwiftUI

struct TeamListItemView: View {
    var teamData: TeamsData
    
    var body: some View {
        HStack {
            if let imageUrl = teamData.img {
                AsyncImage(url: URL(string: imageUrl)!) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.trailing, 10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            } else {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 10)
            }
            
            VStack(alignment: .leading) {
                Text(teamData.name ?? "")
                    .font(Font.system(size: 15))
                    .bold()
                Text("Country: \(teamData.country ?? "")")
                    .font(Font.system(size: 16))
                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
            }
            
            Spacer()
        }
    }
}

#Preview {
    TeamListItemView(teamData: TeamsData(id: "1001", url: "https://www.vlr.gg/team/1001/team-heretics", name: "Team Heretics", img: "https://owcdn.net/img/637b755224c12.png", country: "Europe" ))
}
