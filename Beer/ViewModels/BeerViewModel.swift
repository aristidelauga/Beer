//
//  BeerViewModel.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

@MainActor
final class BeerViewModel: ObservableObject {
  @Published var beers: [Beer] = []
  @Published var favoriteBeers: [Beer] = []
  @Published var isLoading = false
  private var page = 2
  private var beerAPI = BeerAPI()
  
  init() {
    Task { [weak self] in
      try await self?.fetchBeers()
    }
  }
  
  internal func formatTagline() {
    for index in 0..<self.beers.count {
      if beers[index].tagline.hasSuffix(".") {
        beers[index].tagline = String(beers[index].tagline.dropLast())
      }
    }
  }
  
  func fetchBeers() async throws {
    Task {
      do {
        self.beers = try await beerAPI.fetchBeers()
        self.formatTagline()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func fetchMoreBeers() async throws {
    isLoading = true 
    Task {
      do {
        self.beers += try await beerAPI.fetchMoreBeers(page: page)
        self.formatTagline()
        page += 1
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
}
