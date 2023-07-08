//
//  BeerAPI.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

struct BeerAPI {
  func fetchBeers() async throws -> [Beer] {
    let beers = Task { () -> [Beer] in
      guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=2&per_page=25") else {
        throw FetchingError.badURL
      }
      
      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw FetchingError.noResponse
      }
      
      guard let decodedResponse = try? JSONDecoder().decode([Beer].self, from: data) else {
        throw FetchingError.decodingIssue
      }
      
      return decodedResponse
    }
    
    return try await beers.value
    
  }
}
