//
//  FavoriteBeerRow.swift
//  Beer
//
//  Created by Aristide LAUGA on 10/07/2023.
//

import SwiftUI

struct FavoriteBeerRow: View {
  var beer: Beer
  var body: some View {
    VStack {
      BeerImage(beer: beer, width: 100, height: 100)
      Text(beer.name)
        .bold()
        .foregroundColor(.black)
    }
    .padding(15)
    .background(
      LinearGradient(colors: [.gray, .gray.opacity(0.3),.white], startPoint: .bottomTrailing, endPoint: .topLeading)
      .opacity(0.084)
      .cornerRadius(10)
    )
    .shadow(color: .black.opacity(0.2), radius: 4, x: 5, y: 5)
  }
}

struct FavoriteBeerRow_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteBeerRow(beer: Beer.sample)
  }
}
