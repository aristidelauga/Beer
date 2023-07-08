//
//  BeerImage.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerImage: View {
  var beer: Beer
  var body: some View {
    if let url = beer.image_url {
      AsyncImage(url: URL(string: url)) { image in
        image
          .resizable()
          .scaledToFit()
          .frame(maxWidth: 80, maxHeight: 80, alignment: .center)
      } placeholder: {
        ProgressView()
      }
    } else {
      ProgressView()
    }
  }
}

struct BeerImage_Previews: PreviewProvider {
  static var previews: some View {
    BeerImage(beer: Beer.sample)
  }
}
