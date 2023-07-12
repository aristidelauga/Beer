//
//  BeerTabView.swift
//  Beer
//
//  Created by Aristide LAUGA on 10/07/2023.
//

import SwiftUI

struct BeerTabView: View {
  @StateObject var beerVM = BeerViewModel()
  @State private var selection = 0
  var body: some View {
    TabView(selection: $selection) {
      BeerListView(beerVM: beerVM)
        .tabItem {
          Label("Beers", systemImage: selection == 0 ? "wineglass.fill" : "wineglass")
        }
        .tag(0)
      FavoriteBeersView(beerVM: beerVM)
        .tabItem {
          Label("Favorites", systemImage: "star")
        }
        .tag(1)
    }
    .tint(.yellow)
  }
}

struct BeerTabView_Previews: PreviewProvider {
  static var previews: some View {
    BeerTabView()
  }
}
