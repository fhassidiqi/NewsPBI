//
//  BaseResponse.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: String
    var totalResults: Int
    var articles: T
}

