//
//  BaseUseCase.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Combine

protocol BaseUseCase {
    associatedtype Params
    associatedtype Response
    func execute(params: Params) async -> AnyPublisher<Response, Error>
}
