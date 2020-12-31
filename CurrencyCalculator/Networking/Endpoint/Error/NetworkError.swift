//
//  NetworkError.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum NetworkError: String, LocalizedError {
    case urlEncodingFailed = "Parameter encoding failed."
    case jsonEncodingFailed = "Json encoding failed"
    case incompleteParameters = "Missing body or url parameters"
    case unknown = "Something went wrong."

    public var errorDescription: String? {
        return NSLocalizedString(rawValue, comment: "Network Error")
    }
}
