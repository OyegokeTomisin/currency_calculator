//
//  Router.swift
//  AddyLogistics
//
//  Created by OYEGOKE TOMISIN on 19/07/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias NetworkRouterCompletion = (Result<JSON, Error>) -> Void

class Router<EndPoint: EndPointType>: NetworkRouter {

    private var request: DataRequest?
    
    init() { }
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        do {
            request = AF.request(try RequestBuilder(route: route).request.asURLRequest())
            request?.responseData { response in
                self.handleNetworkResponse(for: response.result) { completion($0) }
            }
        } catch {
            handleNetworkResponse(with: error) { completion($0) }
        }
    }
    
    func cancel() {
        request?.task?.cancel()
    }

    private func handleNetworkResponse(for result: Result<Data, AFError>? = nil, with error: Error? = nil, completion: @escaping NetworkRouterCompletion) {
        DispatchQueue.main.async {
            if let error = error {
                completion(.failure(error))
            } else if let result = result {
                switch result {
                case .success(let data):
                    do {
                        completion(.success(try JSON(data: data)))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
