//
//  BeerListView.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerListView: View {
  @StateObject var beerVM = BeerViewModel()
  @Environment(\.isSearching)
  private var isSearching: Bool
  var body: some View {
    NavigationStack {
      ScrollViewReader { proxy in
        ScrollView(.vertical,showsIndicators: false) {
          LazyVStack(alignment: .leading) {
            ForEach(beerVM.filteredBeers) { beer in
              BeerRow(beer: beer)
                .onAppear {
                  if beer == beerVM.beers.last ?? beer {
                    Task {
                      do {
                        try await beerVM.fetchMoreBeers()
                      } catch {
                        throw FetchingError.moreFetchingUnavailable
                      }
                    }
                  }
                }
            }
            
            if beerVM.isLoading {
              ProgressView()
                .frame(maxWidth: .infinity, alignment: .center)
            }
          }
          .padding()
        }
      }
    }
    .searchable(text: $beerVM.searchText, prompt: "Search for a beer")
  }
}

struct BeerListView_Previews: PreviewProvider {
  static var previews: some View {
    BeerListView()
  }
}
