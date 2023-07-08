//
//  BeerRow.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerRow: View {
  var beer: Beer
  var body: some View {
    HStack(alignment: .top, spacing: 5) {
      BeerImage(beer: beer)
      BeerDescriptionView(beer: beer)
    }
  }
}

struct BeerRow_Previews: PreviewProvider {
  static var previews: some View {
    BeerRow(beer: Beer.sample)
  }
}
