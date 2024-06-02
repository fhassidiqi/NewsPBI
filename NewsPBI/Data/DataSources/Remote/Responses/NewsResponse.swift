//
//  NewsResponse.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation

struct NewsResponse: Codable {
    var source: NewsSource
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
}

struct NewsSource: Codable, Hashable {
    var id: String?
    var name: String
}
