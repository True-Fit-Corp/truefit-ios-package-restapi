//
//  File.swift
//  truefit-ios-package-restapi
//
//  Created by Aniruddha Bhajan on 24/12/24.
//


public enum TFEnvironment {
  case staging
  case production
}

internal let TFProdDomain = "consumer.truefitcorp.com"
internal let TFStagingDomain = "ds-prod-ga-2-tf-ds-c503f2f8.truefitcorp.com"
internal let tfTokenKey = "tfToken"
internal let tfUserTokenHeader = "X-TF-User-Token"
