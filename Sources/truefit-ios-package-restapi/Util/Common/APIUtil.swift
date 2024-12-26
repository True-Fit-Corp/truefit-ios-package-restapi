//
//  File.swift
//  truefit-ios-package-restapi
//
//  Created by Aniruddha Bhajan on 24/12/24.
//

import Foundation

internal class APIUtil {
  static let shared = APIUtil()
  
  private init() {}
  
  enum APIError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingFailed
    case networkError(Error)
    
    var errorDescription: String? {
      switch self {
      case .invalidURL:
        return "The provided URL is invalid"
      case .noData:
        return "The response returned no data"
      case .decodingFailed:
        return "Failed to decode the response"
      case .networkError(let error):
        return "Network error occured. Error: \(error.localizedDescription)"
      }
    }
  }
  
  func fetch<T:Decodable> (urlString: String, method: String? = "GET", headers: [String: String]? = nil) async throws -> T {
    guard let url = URL(string: urlString) else {
      throw APIError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.httpShouldHandleCookies = false
    
    if let headers = headers {
      for (key, value) in headers {
        request.setValue(value, forHTTPHeaderField: key)
      }
    }
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
        throw APIError.networkError(NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil))
      }
      
      do {
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        return decodedObject
      }
      catch{
        throw APIError.decodingFailed
      }
    }
    catch {
      throw APIError.networkError(error)
    }
  }
}
