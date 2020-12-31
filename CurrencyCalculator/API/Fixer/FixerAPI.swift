//
//  FixerAPI.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 31/12/2020.
//

import Foundation

enum FixerAPI {
    case historicalConversion(date: String, currencyConversionData: EndpointParameter)
}

extension FixerAPI: EndPointType {

    var path: String {
        switch self {
        case .historicalConversion(let date, _):
            return date
        }
    }

    var task: HTTPTask {
        switch self {
        case .historicalConversion(_ , let currencyConversionData):
            return.requestParameters(encoding: .urlEncoding, urlParameters: currencyConversionData.asParameter)
        }
    }

    var headers: HTTPHeaders? {
        nil
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .historicalConversion:
            return .get
        }
    }
}
