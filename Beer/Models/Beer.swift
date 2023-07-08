//
//  Beer.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

struct Beer: Identifiable, Decodable, Hashable {
  let id: Int
  let name: String
  var tagline: String
  let description: String
  let imageUrl: String?
  let boilVolume: BoilVolume?
  let ingredients: Ingredients?
  let foodPairing: [String]?
  
  
  enum CodingKeys: String, CodingKey {
    case id, name, tagline, description
    case imageUrl = "image_url"
    case boilVolume = "boil_volume"
    case ingredients
    case foodPairing = "food_pairing"
  }
  
}

extension Beer {
  static var sample = Beer(id: 26,
                           name: "Skull Candy",
                           tagline: "Pacific Hopped Amber Bitter.",
                           description: "The first beer that we brewed on our newly commissioned 5000 litre brewhouse in Fraserburgh 2009. A beer with the malt and body of an English bitter, but the heart and soul of vibrant citrus US hops.",
                           imageUrl: "https://images.punkapi.com/v2/keg.png",
                           boilVolume: BoilVolume(value: 25, unit: "litres"),
                           ingredients: Ingredients(
                            malt: [
                            Malt(name: "Extra Pale", amount: BoilVolume(value: 2.81, unit: "kilograms")),
                            Malt(name: "Caramalt", amount: BoilVolume(value: 0.63, unit: "kilograms")),
                            Malt(name: "Crystal 120", amount: BoilVolume(value: 0.31, unit: "kilograms")),
                           ],
                            hops: [
                            Hop(name: "Cascade", amount: BoilVolume(value: 25, unit: "grams"), add: "start", attribute: "bitter"),
                            Hop(name: "Cascade", amount: BoilVolume(value: 18.8, unit: "grams"), add: "end", attribute: "flavour"),
                            Hop(name: "Centennial", amount: BoilVolume(value: 18.8, unit: "grams"), add: "end", attribute: "flavour"),
                            Hop(name: "Amarillo", amount: BoilVolume(value: 25, unit: "grams"), add: "end", attribute: "flavour"),
                            Hop(name: "Simcoe", amount: BoilVolume(value: 31.3, unit: "grams"), add: "end", attribute: "flavour"),
                           ],
                            yeast: "Wyeast 1056 - American Ale™"),
//                           ingredients: Ingredients(yeast: "Wyeast 1056 - American Ale™"),
                           foodPairing: ["Haggis bon bons","Rosemary and lemon roast chicken","Oatmeal and cranberry cookies"]
  )
  
  static func == (lhs: Beer, rhs: Beer) -> Bool {
    return lhs.id == rhs.id &&
    lhs.name == rhs.name &&
    lhs.tagline == rhs.tagline &&
    lhs.description == rhs.description &&
    lhs.imageUrl == rhs.imageUrl &&
    lhs.boilVolume == rhs.boilVolume &&
    lhs.ingredients == rhs.ingredients &&
    lhs.foodPairing == rhs.foodPairing
  }
}
