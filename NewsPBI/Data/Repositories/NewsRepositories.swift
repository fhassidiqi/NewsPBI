//
//  NewsRepositories.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Combine

final class NewsRepositories: NewsRepositoryProtocol {
    
    private let dataSource = APIDataSources.shared
    static let shared = NewsRepositories()
    
    func getNews() -> AnyPublisher<[NewsModel], any Error> {
        return dataSource.getNews()
            .map { news in
                let news = news.map { response in
                    return NewsModel(
                        source: response.source,
                        author: response.author ?? "Anonymous",
                        title: response.title,
                        description: response.description.orEmpty(),
                        url: response.url,
                        urlToImage: response.urlToImage.orEmpty(),
                        publishedAt: response.publishedAt,
                        content: response.content.orEmpty()
                    )
                }
                return news
            }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
    
    func getTopHeadlines() -> AnyPublisher<[NewsModel], any Error> {
        return dataSource.getTopHeadlines()
            .map { news in
                let news = news.map { response in
                    return NewsModel(
                        source: response.source,
                        author: response.author ?? "Anonymous",
                        title: response.title,
                        description: response.description.orEmpty(),
                        url: response.url,
                        urlToImage: response.urlToImage.orEmpty(),
                        publishedAt: response.publishedAt,
                        content: response.content.orEmpty()
                    )
                }
                return news
            }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
