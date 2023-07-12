//
//  BeerDetailView.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct BeerDetailView: View {
  @ObservedObject var beerVM: BeerViewModel
  @Binding var path: NavigationPath
  var beer: Beer
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 15) {
        BeerBannerDetails(beer: beer)
        TaglineDetails(beer: beer)
        DescriptionDetails(beer: beer)
        IngredientsDetails(beer: beer)
        FoodPairingDetails(beer: beer)
        NavigationLink(value: beerVM.randomBeer) {
          Text("Switch to another random beer")
            .frame(maxWidth: .infinity)
            .foregroundColor(.blue)
            .padding(.top)
        }
        Button {
          path.removeLast(path.count)
        } label: {
          Text("Go back to home screen")
            .frame(maxWidth: .infinity)
            .foregroundColor(.blue)
        }
      }
    }
    .navigationTitle(beer.name)
    .navigationBarTitleDisplayMode(.inline)
    .padding(.horizontal, 10)
    .navigationDestination(for: Beer.self) { _ in
      BeerDetailView(beerVM: beerVM, path: $path, beer: beerVM.randomBeer)
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          if !beerVM.favoriteBeers.contains(beer) {
            beerVM.addToFavoriteBeers(beer)
          } else {
            beerVM.removeFromFavoriteBeers(beer)
          }
//          beerVM.addToFavoriteBeers(beer)
        } label: {
          Image(systemName: beerVM.favoriteBeers.contains(beer) ? "star.fill" : "star")
            .foregroundColor(beerVM.favoriteBeers.contains(beer) ? Color.yellow : Color.black)
        }
      }
    }
  }
}

struct BeerDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BeerDetailView(beerVM: BeerViewModel(), path: .constant(NavigationPath()), beer: Beer.sample)
  }
}


