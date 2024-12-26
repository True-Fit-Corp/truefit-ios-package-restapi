//
//  File.swift
//  TrueFit
//
//  Created by Aniruddha Bhajan on 26/12/24.
//

import Foundation

class RecHandler {
  static let shared = RecHandler()
  private init() {}
  
  func getRecommendation(storeKey: String, environment: TFEnvironment, locale: String) async throws -> TFRecommendation? {
    let baseUrl = APIUtil.shared.getBaseURL(storeKey, environment)
    let apiURL = "\(baseUrl)/consumer/public/v3/\(storeKey)/fit/tfc-fitrec-product?s=\(storeKey)&locale=\(locale)platform=web&applicationName=\(storeKey)&deviceType=mobile"
    let token = try await TokenHandler.shared.getToken(storeKey: storeKey, environment: environment)
    
    if !token.isEmpty {
      let recommendation: TFRecommendation = try await APIUtil.shared.fetch(
        urlString: apiURL,
        method: "GET",
        headers: [tfUserTokenHeader: token]
      )
      
      return recommendation
    }
    return nil
  }
}
