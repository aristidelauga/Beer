//
//  BeerListView.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerListView: View {
  @StateObject var beerVM = BeerViewModel()
  var body: some View {
    NavigationStack {
      ScrollView(.vertical,showsIndicators: false) {
        LazyVStack(alignment: .leading) {
          ForEach(beerVM.beers) { beer in
            BeerRow(beer: beer)
          }
        }
        .padding()
      }
      .background(Color.black.ignoresSafeArea())
    }
  }
}

struct BeerListView_Previews: PreviewProvider {
  static var previews: some View {
    BeerListView()
  }
}
