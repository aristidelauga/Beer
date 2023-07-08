//
//  FetchingError.swift
//  Beer
//
//  Created by Aristide LAUGA on 08/07/2023.
//

import Foundation

enum FetchingError: Error {
  case badURL
  case noResponse
  case decodingIssue
  case moreFetchingUnavailable
}
