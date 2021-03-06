//
//  NetworkEnvironment.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum Environment {
    case staging
    
    var baseURL: String {
        switch self {
        case .staging:
            return "https://"
        }
    }
}
