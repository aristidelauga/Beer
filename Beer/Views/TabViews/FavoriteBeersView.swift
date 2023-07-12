//
//  FavoriteBeersView.swift
//  Beer
//
//  Created by Aristide LAUGA on 10/07/2023.
//

import SwiftUI

struct FavoriteBeersView: View {
  @ObservedObject var beerVM: BeerViewModel
  private let columns = [
    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 5),
    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 5),
  ]
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        LazyVGrid(columns: columns) {
          ForEach(beerVM.favoriteBeers, id: \.id) { beer in
            FavoriteBeerRow(beer: beer)
          }
        }
      }
      .navigationTitle("Favorite beers")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
} 

struct FavoriteBeersView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteBeersView(beerVM: BeerViewModel())
  }
}
