//
//  GetTopHeadlineUseCase.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Combine

class GetTopHeadlineUseCase: BaseUseCase {
    
    typealias Params = Param
    typealias Response = [NewsModel]
    private let repo = NewsRepositories.shared
    
    func execute(params: Params) -> AnyPublisher<[NewsModel], Error> {
        return repo.getTopHeadlines()
    }
    
    struct Param { }
}
