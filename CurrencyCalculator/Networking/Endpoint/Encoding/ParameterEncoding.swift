//
//  ParameterEncoding.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    func encode(urlRequest: inout URLRequest, bodyParameters: Parameters?, urlParameters: Parameters?) throws {
        switch self {
        case .urlEncoding:
            guard let urlParameters = urlParameters else { throw NetworkError.incompleteParameters }
            try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
        case .jsonEncoding:
            guard let bodyParameters = bodyParameters else { throw NetworkError.incompleteParameters }
            try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
        case .urlAndJsonEncoding:
            guard let bodyParameters = bodyParameters,
                  let urlParameters = urlParameters else { throw NetworkError.incompleteParameters }
            try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
        }
    }
}
