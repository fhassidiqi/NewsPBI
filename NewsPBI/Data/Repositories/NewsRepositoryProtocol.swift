//
//  NewsRepositoryProtocol.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Combine

protocol NewsRepositoryProtocol {
    func getNews() -> AnyPublisher<[NewsModel], Error>
    func getTopHeadlines() -> AnyPublisher<[NewsModel], Error>
}
