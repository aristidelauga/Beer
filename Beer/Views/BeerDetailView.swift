//
//  BeerDetailView.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct BeerDetailView: View {
  var beer: Beer
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 15) {
        HStack {
          Spacer()
          BeerImage(beer: beer, width: 180, height: 180)
          Spacer()
        }
        TaglineDetails(beer: beer)
        DescriptionDetails(beer: beer)
        IngredientsDetails(beer: beer)
        FoodPairingDetails(beer: beer)
      }
    }
    .navigationTitle(beer.name)
    .padding(.horizontal, 10)
  }
}

struct BeerDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BeerDetailView(beer: Beer.sample)
  }
}
