//
//  NetworkRouter.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//

import Foundation

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
