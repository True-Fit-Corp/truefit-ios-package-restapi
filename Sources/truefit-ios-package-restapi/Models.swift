//
//  File.swift
//  truefit-ios-package-restapi
//
//  Created by Aniruddha Bhajan on 24/12/24.
//

public struct Recommendations: Decodable {
  let recommendations: [String: Recommendation]
}

internal struct Recommendation: Decodable {
  let status: String
  let recommendable: Bool?
  let recommend: Bool?
  let size: String?
  let score: Int?
  var cta: CTA?
  let profileSwitcherCTA: CTA?
}

internal struct CTA: Decodable {
  let message: String
  var url: String?
}
