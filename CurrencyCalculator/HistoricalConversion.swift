//
//  CurrencyConversion.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 31/12/2020.
//

import Foundation

struct HistoricalConversion {
    let base: String = "EUR"
    let symbol: String
}

extension HistoricalConversion: EndpointParameter {
    var asParameter: Parameters {
        var params = Parameters()
        params[FixerAPIConstant.access_key.key] = Environment.dev.FIXER_API_KEY
        params[FixerAPIConstant.symbols.key] = symbol
        params[FixerAPIConstant.base.key] = base
        return  params
    }
}
