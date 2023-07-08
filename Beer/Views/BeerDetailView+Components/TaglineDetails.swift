//
//  TaglineDetails.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import SwiftUI

struct TaglineDetails: View {
  var beer: Beer
  var body: some View {
    VStack(alignment: .leading, spacing: 15){
      Text("Tagline")
        .font(.title3)
        .bold()
      Text(beer.tagline)
        .foregroundColor(.secondary)
    }
  }
}

struct TaglineDetails_Previews: PreviewProvider {
  static var previews: some View {
    TaglineDetails(beer: Beer.sample)
  }
}
