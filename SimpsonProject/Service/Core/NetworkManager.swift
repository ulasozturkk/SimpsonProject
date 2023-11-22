//
//  NetworkManager.swift
//  SimpsonProject
//
//  Created by macbook pro on 22.11.2023.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func request<T: Codable>(_ endpoint : EndPoint,completion : @escaping(Result<T,NetworkError>) -> ())
}


class NetworkManager: NetworkManagerProtocol {

    static let shared = NetworkManager()
    private init() {}

    func request<T : Codable>(_ endpoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> ()) {
            
            let response = AF.request(try! endpoint.requset().asURLRequest()).response { responses in
                switch responses.result {
                case .success:
                    // başarı durumunda data var mı kontrol et
                    if let status = responses.response?.statusCode {
                        if status <= 299 && status >= 200 {
                            if let data = responses.data {
                                do {
                                    // demek ki data var, decode et ve escapingi cağır
                                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                                    completion(.success(decodedData))
                                } catch {
                                    print("Decoding Error: \(error)") // Hata detayını yazdır
                                    let error : NetworkError = .parsingError
                                    completion(.failure(error))
                                }
                            } else {
                                print("No Data Received")
                                let error : NetworkError = .noDataError
                                completion(.failure(error))
                            }
                        } else if status >= 400 && status <= 499 {
                            print("Client Error: \(status)")
                            let error : NetworkError = .NotFoundError
                            completion(.failure(error))
                        } else if status >= 500 {
                            print("Server Error: \(status)")
                            let error : NetworkError = .ServerError
                            completion(.failure(error))
                        } else {
                            print("Unknown Error: \(status)")
                            let error : NetworkError = .UnKnownError
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    print("Network Request Failed: \(error)")
                    let networkError: NetworkError = .NetworkingError
                    completion(.failure(networkError))
                }
            }
            response.resume()
        }
}
