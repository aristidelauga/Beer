//
//  BeerBannerDetails.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct BeerBannerDetails: View {
  var beer: Beer
  var body: some View {
    HStack {
      Spacer()
      BeerImage(beer: beer, width: 180, height: 180)
      Spacer()
    }
  }
}
struct BeerBannerDetails_Previews: PreviewProvider {
    static var previews: some View {
      BeerBannerDetails(beer: Beer.sample)
    }
}
