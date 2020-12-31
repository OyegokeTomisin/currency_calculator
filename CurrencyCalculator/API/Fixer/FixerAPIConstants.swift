//
//  FixerAPIConstants.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 31/12/2020.
//

import Foundation

enum FixerAPIConstant: String {
    case base
    case symbols
    case access_key

    var key: String { rawValue }
}
