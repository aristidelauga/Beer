//
//  FoodPairingDetails.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct FoodPairingDetails: View {
  var beer: Beer
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Food Pairing")
        .font(.title3)
        .bold()
      ForEach(beer.foodPairing ?? [""], id: \.self) { food in
        Text("- " + food)
          .italic()
      }
    }
  }
}

struct FoodPairingDetails_Previews: PreviewProvider {
  static var previews: some View {
    FoodPairingDetails(beer: Beer.sample)
  }
}
