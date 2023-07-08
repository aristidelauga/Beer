//
//  Hop.swift
//  Beer
//
//  Created by Aristide LAUGA on 09/07/2023.
//

import Foundation

struct Hop: Codable, Hashable {
  let name: String?
  let amount: BoilVolume?
  let add: String?
  let attribute: String?
}
