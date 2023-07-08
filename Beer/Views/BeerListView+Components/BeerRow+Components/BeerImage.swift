//
//  BeerImage.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerImage: View {
  var beer: Beer
  var width: CGFloat
  var height: CGFloat
  var body: some View {
    if let url = beer.imageUrl {
      AsyncImage(url: URL(string: url)) { image in
        image
          .resizable()
          .scaledToFit()
          .frame(maxWidth: width, maxHeight: height, alignment: .center)
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
    BeerImage(beer: Beer.sample, width: 80, height: 80)
  }
}
