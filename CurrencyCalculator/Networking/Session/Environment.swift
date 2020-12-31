//
//  NetworkEnvironment.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum Environment {

    case dev

    var FIXER_API_KEY: String {
        switch self {
        case .dev:
            return "583da8c7a952ef1820a77964748c8956"
        }
    }
    
    var baseURL: String {
        switch self {
        case .dev:
            return "http://data.fixer.io/api"
        }
    }
}
