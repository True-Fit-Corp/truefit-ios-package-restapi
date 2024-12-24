// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class TFiOSPackage {
  public var environment: TFEnvironment = .production
  public var storeKey: String
  public var styleId: String
  public var locale: String
  public var userId: String
  private var baseUrlStr: String
  
  
  public init(environment: TFEnvironment, storeKey: String, styleId: String, locale: String?, userId: String?){
    self.environment = environment
    self.storeKey = storeKey
    self.styleId = styleId
    self.locale = locale ?? "en-US"
    self.userId = userId ?? ""
    self.baseUrlStr = environment == TFEnvironment.production ?"https://\(storeKey)-\(TFProdDomain)": TFStagingDomain
  }
  
  public func getRecommendation () {}
  
  public func loadWebView () {}
}
