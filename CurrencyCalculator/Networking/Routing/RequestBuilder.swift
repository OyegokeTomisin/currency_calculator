//
//  RequestBuilder.swift
//  CurrencyCalculator
//
//  Created by OYEGOKE TOMISIN on 30/12/2020.
//

import Foundation

final class RequestBuilder<EndPoint: EndPointType> {

    private let task: HTTPTask
    private let requestMethod: HTTPMethod
    private (set) var request: URLRequest

    init(route: EndPoint) throws {
        self.task = route.task
        self.requestMethod = route.httpMethod
        self.request = URLRequest(url: route.baseURL.appendingPathComponent(route.path))
        try buildRequest()
    }

    private func buildRequest() throws {
        addDefaultHeaders()
        request.httpMethod = requestMethod.rawValue
        switch task {
        case .request:
            break
        case .requestParameters(let encoding, let bodyParameters, let urlParameters, let additionHeaders):
            addAdditionalHeaders(additionHeaders)
            try configureParameters(with: encoding, bodyParameters: bodyParameters, urlParameters: urlParameters)
        }
    }

    private func addDefaultHeaders() {
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?) {
        if let headers = additionalHeaders {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
    }

    private func configureParameters(with bodyEncoding: ParameterEncoding, bodyParameters: Parameters?, urlParameters: Parameters?) throws {
        try bodyEncoding.encode(urlRequest: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
    }
}
