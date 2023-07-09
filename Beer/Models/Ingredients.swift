//
//  Ingredients.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import Foundation

struct Ingredients: Codable, Hashable {
  let malt: [Malt]
  let hops: [Hop]?
  let yeast: String?
}
