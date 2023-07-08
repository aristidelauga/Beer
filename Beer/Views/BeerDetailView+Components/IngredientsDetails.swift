//
//  IngredientsDetails.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct IngredientsDetails: View {
  var beer: Beer
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
//      Text("Ingredients")
//        .font(.title3)
//        .bold()
      ForEach(beer.ingredients.malt ?? Beer.sample.ingredients?.malt, id: \.self) { malt in
        HStack {
          Text("- " + malt.name + ",  ")
//          Text("\(malt.amount.value)")
//          Text("\(malt.amount.unit)")
        }
      }
    }
  }
}

struct IngredientsDetails_Previews: PreviewProvider {
  static var previews: some View {
    IngredientsDetails(beer: Beer.sample)
  }
}
