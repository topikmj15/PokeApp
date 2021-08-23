//
//  BaseRequest.swift
//  PokeApp
//
//  Created by GMV on 20/08/21.
//

import Alamofire

struct BaseRequest {
    static func request<T: Decodable> (
        request: URLRequestConvertible,
        onSuccess: @escaping (_ response: T)-> Void,
        onFailure: @escaping (_ error: String, _ code: Int?)-> Void
    ) {
        if Reachability.isConnectedToNetwork() {
            AF.request(request)
                .validate()
                .responseDecodable() { (response: DataResponse<T, AFError>) in
                    let errorMessage = response.error?.errorDescription
                    let code = response.error?.responseCode == nil
                        ? response.response?.statusCode
                        : response.error?.responseCode
                    if let data = response.value {
                        if let message = errorMessage {
                            onFailure(message, code)
                        } else {
                            onSuccess(data)
                        }
                    } else {
                        onFailure(errorMessage ?? "error response nil", code)
                    }
                }
        } else {
            onFailure("No internet connection", -1000)
        }
        
    }
}
