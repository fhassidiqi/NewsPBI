//
//  APIDataSources.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Alamofire
import Combine

final class APIDataSources {
    
    static let shared = APIDataSources()
    private let baseUrl = "https://newsapi.org/v2"
    private let apiKey = "d613ee4318ab4d73ba168a1dca5d9bd5"
    
    func getNews() -> AnyPublisher<[NewsResponse], AFError> {
        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "q": "news"
        ]
        let url = baseUrl + APIEndpoint.everything.rawValue
        
        return AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .publishDecodable(type: BaseResponse<[NewsResponse]>.self)
            .value()
            .map { response in
                response.articles
            }
            .eraseToAnyPublisher()
    }
    
    func getTopHeadlines() -> AnyPublisher<[NewsResponse], AFError> {
        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "country": "us"
        ]
        let url = baseUrl + APIEndpoint.topHeadlines.rawValue
        
        return AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .publishDecodable(type: BaseResponse<[NewsResponse]>.self)
            .value()
            .map { response in
                response.articles
            }
            .eraseToAnyPublisher()
    }
    
    private enum APIEndpoint: String {
        case topHeadlines = "/top-headlines"
        case everything = "/everything"
    }
}
