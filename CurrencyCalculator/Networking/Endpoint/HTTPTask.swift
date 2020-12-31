//
//  HTTPTask.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    case requestParameters(encoding: ParameterEncoding, bodyParameters: Parameters? = nil, urlParameters: Parameters? = nil, additionHeaders: HTTPHeaders? = nil)
}
