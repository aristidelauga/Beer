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
      Text("Ingredients")
        .font(.title3)
        .bold()
      ForEach(beer.ingredients.malt,  id: \.self) { malt in
        if let maltName = malt.name, let maltValue = malt.amount?.value, let maltUnit = malt.amount?.unit {
          Text("-  \(maltName), " + "\(maltValue) \(maltUnit)")
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
