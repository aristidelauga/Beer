//
//  Beer.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

struct Beer: Identifiable, Decodable {
  let id: Int
  let name: String
  var tagline: String
  let description: String
  let image_url: String?
}

extension Beer {
  static var sample = Beer(id: 26,
                           name: "Skull Candy",
                           tagline: "Pacific Hopped Amber Bitter.",
                           description: "The first beer that we brewed on our newly commissioned 5000 litre brewhouse in Fraserburgh 2009. A beer with the malt and body of an English bitter, but the heart and soul of vibrant citrus US hops.",
                           image_url: "https://images.punkapi.com/v2/keg.png")
}
