//
//  BeerDescriptionView.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerDescriptionView: View {
  var beer: Beer
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(beer.name)
        .font(.system(.title3, weight: .bold))
      Text(beer.tagline)
        .font(.system(.callout))
        .foregroundColor(.secondary)
      Text(beer.description)
        .lineLimit(2)
    }
  }
}

struct BeerDescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    BeerDescriptionView(beer: Beer.sample)
  }
}
