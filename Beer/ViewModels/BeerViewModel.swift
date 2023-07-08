//
//  BeerViewModel.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

final class BeerViewModel: ObservableObject {
  @Published var beers: [Beer] = []
  @Published var favoriteBeers: [Beer] = []
  @Published var isLoading = false
  private var page = 1
  
  private var beerAPI = BeerAPI()
  
  init() {
    Task { [weak self] in
      await self?.fetchBeers()
      
    }
  }
  
  internal func formatTagline() {
    for index in 0..<self.beers.count {
      if beers[index].tagline.hasSuffix(".") {
        beers[index].tagline = String(beers[index].tagline.dropLast())
      }
    }
  }
  
  func fetchBeers() async {
    Task {
      do {
        self.beers = try await beerAPI.fetchBeers()
        self.formatTagline()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  
}
