//
//  NetworkRoute.swift
//  PokeApp
//
//  Created by GMV on 20/08/21.
//

import Alamofire

enum RequestRoute: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        <#code#>
    }
    
    static let baseURL = NetworkConfig.baseURL
}
