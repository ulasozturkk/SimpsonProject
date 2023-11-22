

import Foundation
import Alamofire
// baseurl = https://api.sampleapis.com/simpsons


/*
 1- httpmethod
 2-endpoint (baseurl,path,method,headers,request)
 3-error
 
 */

enum NetworkError : String,Error {
    case unableToCompleteError = "unable to complete"
    case parsingError = "parsing error"
    case noDataError = "no data received"
    case NetworkingError = "networking error"
    case NotFoundError = "not found!"
    case ServerError = "server error"
    case UnKnownError = "an unknown error occured"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}


protocol EndPointDelegate {
    var baseUrl : String {get}
    var path : String {get}
    var method : HTTPMethod {get}
    var header : [String : String]? {get}
    func requset() -> URLRequest
}


enum EndPoint {
    case getCharacters
    case getProducts
    case getEpisodes
}
// endpointi ve protokolünü tanımladık şimdi genişleticez

extension EndPoint : EndPointDelegate{
    var baseUrl: String {
        return "https://api.sampleapis.com/simpsons"
    }
    
    var path: String {
        switch self{
        case .getCharacters:
            return "/characters"
        case .getProducts:
            return "/products"
        case .getEpisodes:
            return "/episodes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        case .getEpisodes:
            return .get
        case .getProducts:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func requset() -> URLRequest {
        guard var component = URLComponents(string: baseUrl + path) else {
            fatalError("url error")
        }
        
        guard let url = component.url else {
            fatalError("url error")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let header = header {
            header.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
    
    
}


