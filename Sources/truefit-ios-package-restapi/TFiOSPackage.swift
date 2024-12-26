// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class TFiOSPackage {
  public var environment: TFEnvironment = .production
  public var storeKey: String
  public var styleId: String
  public var locale: String?
  public var userId: String?
  private var baseUrlStr: String
  
  
  public init(environment: TFEnvironment, storeKey: String, styleId: String, locale: String? = "en-US", userId: String? = nil){
    self.environment = environment
    self.storeKey = storeKey
    self.styleId = styleId
    self.locale = locale
    self.userId = userId
    self.baseUrlStr = environment == TFEnvironment.production ?"https://\(storeKey)-\(TFProdDomain)": TFStagingDomain
  }
  
  public func getRecommendation () async throws -> TFRecommendation {
    return try await RecHandler.shared.getRecommendation(storeKey: storeKey, environment: environment, locale: locale!)!
  }
  
  public func launchWebView () {}
}
