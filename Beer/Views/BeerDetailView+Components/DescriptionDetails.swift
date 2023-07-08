//
//  DescriptionDetails.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct DescriptionDetails: View {
  var beer: Beer
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Description")
        .font(.title3)
        .bold()
      HStack {
        Spacer()
        Text(beer.description)
        Spacer()
      }
    }
  }
}

struct DescriptionDetails_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionDetails(beer: Beer.sample)
  }
}
