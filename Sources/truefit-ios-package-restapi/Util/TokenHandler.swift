//
//  File.swift
//  TrueFit
//
//  Created by Aniruddha Bhajan on 26/12/24.
//

import Foundation

class TokenHandler {
  static let shared = TokenHandler()
  
  private init() {}
  
  private let token: String = UserDefaults.standard.string(forKey: tfTokenKey) ?? ""
  
  private func setToken(_ token: String) {
    UserDefaults.standard.set(token, forKey: tfTokenKey)
  }
  
  func updateToken(_ newToken: String) {
    if newToken != token {
      setToken(newToken)
    }
  }
  
  func getToken (storeKey: String, environment: TFEnvironment) async throws -> String {
    guard !token.isEmpty else {
      let baseUrl = APIUtil.shared.getBaseURL(storeKey, environment)
      let apiURL = "\(baseUrl)/profile/token/v3/\(storeKey)/token"
      
      let tokenResponse: TFToken = try await APIUtil.shared.fetch(
        urlString: apiURL,
        method: "GET",
        headers: ["accept": "application/json"]
      )
      setToken(tokenResponse.token)
      return tokenResponse.token
    }
    
    return token
  }
}
