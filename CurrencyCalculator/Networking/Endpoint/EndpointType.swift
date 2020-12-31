//
//  EndpointType.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var httpMethod: HTTPMethod { get }
}

extension EndPointType {
    var baseURL: URL {
        guard let url = URL(string: SessionManager.environment.baseURL) else {
            fatalError("Base URL could not be configured")
        }
        return url
    }
}
