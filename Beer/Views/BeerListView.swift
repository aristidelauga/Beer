//
//  BeerListView.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import SwiftUI

struct BeerListView: View {
  @StateObject var beerVM = BeerViewModel()
  @State private var path = NavigationPath()
  @Environment(\.isSearching)
  private var isSearching: Bool
  var body: some View {
    NavigationStack(path: $path) {
      ScrollView(.vertical,showsIndicators: false) {
        LazyVStack(alignment: .leading) {
          ForEach(beerVM.filteredBeers, id: \.id) { beer in
            NavigationLink(value: beer) {
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
          }
          if beerVM.isLoading {
            ProgressView()
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        .padding()
      }
      .navigationDestination(for: Beer.self) { beer in
        BeerDetailView(beerVM: beerVM, path: $path, beer: beer)
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
