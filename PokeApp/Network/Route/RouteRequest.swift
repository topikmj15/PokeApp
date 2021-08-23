//
//  NetworkRoute.swift
//  PokeApp
//
//  Created by Topik Mujianto on 20/08/21.
//

import Alamofire

enum RouteRequest: URLRequestConvertible {
  static let baseURLString = NetworkConfig.baseURL
  
  case doGetPokemonList(param: [String: Any])
  case doGetPokemonDetail(pokeId: Int64)
  case doGetPokemonSpecies(pokeId: Int64)
  case doGetPokemonType(pokeId: Int64)
  case doGetEvolutionChain(pokeId: Int64)
  
  var method: HTTPMethod {
    return .get
  }
  
  var res: (path: String, param: [String: Any]) {
    switch self {
    case .doGetPokemonList(let param):
      return (Endpoint.POKEMON, param)
    case .doGetPokemonDetail(let name):
      return ("\(Endpoint.POKEMON)/\(name)", [:])
    case .doGetPokemonSpecies(let pokeId):
      return ("\(Endpoint.SPECIES)/\(pokeId)", [:])
    case .doGetEvolutionChain(let pokeId):
      return ("\(Endpoint.CHAIN)/\(pokeId)", [:])
    case .doGetPokemonType(let pokeId):
      return ("\(Endpoint.TYPE)/\(pokeId)", [:])
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    var url: URL?
    var urlRequest: URLRequest?
    url = try RouteRequest.baseURLString.asURL()
    urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
    urlRequest?.httpMethod = method.rawValue
    urlRequest = try URLEncoding.default.encode(urlRequest!, with: res.param)
    return urlRequest!
  }
  
}
