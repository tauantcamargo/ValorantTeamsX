//
//  TeamsDataService.swift
//  ValorantTeamsX
//
//  Created by Tauan Tathiell Camargo on 05/07/24.
//

import Foundation

struct TeamsDataService {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func teamsSearch(region: String?, limit: Int?) async -> [TeamsData] {
        guard apiKey != nil else {
            return [TeamsData]()
        }
        
        var endpointUrl = "https://valorant-esports1.p.rapidapi.com/v1/teams"
        
        let headers = [
            "x-rapidapi-key": apiKey ?? "",
            "x-rapidapi-host": "valorant-esports1.p.rapidapi.com"
        ]
 
        if region != nil && region != ""  {
            endpointUrl.append("?region=\(region!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!.lowercased())")
        }
        
        if let limit = limit {
            endpointUrl.append("\(region != nil && region != "" ? "&" : "?")limit=\(String(limit))")
        }
        
        if let url = URL(string: "\(endpointUrl)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                
                do {
                    let teamsResponse = try decoder.decode(TeamsSearch.self, from: data)
                    
                    return teamsResponse.data
                } catch {
                    print("Error to decode the data \(error)")
                    return [TeamsData]()
                }
            } catch {
                print("Error to request api \(error)")
                return [TeamsData]()
            }
        }
        
        return [TeamsData]()
    }
    
    func teamSearch(id: String?) async -> TeamData? {
        guard apiKey != nil else {
            return nil
        }
        
        let endpointUrl = "https://valorant-esports1.p.rapidapi.com/v1/teams"
        
        let headers = [
            "x-rapidapi-key": apiKey ?? "",
            "x-rapidapi-host": "valorant-esports1.p.rapidapi.com"
        ]
        
        if let id = id {
            if let url = URL(string: "\(endpointUrl)/\(id)") {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                
                do {
                    let (data, _) = try await URLSession.shared.data(for: request)
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let response = try decoder.decode(TeamSearch.self, from: data)
                        
                        return response.data
                    } catch {
                        print("Error to decode the data \(error)")
                        return nil
                    }
                } catch {
                    print("Error to request api \(error)")
                    return nil
                }
            }
        }
        
        return nil
    }
}
