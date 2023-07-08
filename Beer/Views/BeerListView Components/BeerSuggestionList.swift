//
//  BeerSuggestionList.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerSuggestionList: View {
  @ObservedObject var beerVM: BeerViewModel
  var body: some View {
    ForEach(beerVM.beers) { beer in
      Text(beer.name)
        .searchCompletion(beer.name)
    }
  }
}

struct BeerSuggestionList_Previews: PreviewProvider {
  static var previews: some View {
    BeerSuggestionList(beerVM: BeerViewModel())
  }
}
