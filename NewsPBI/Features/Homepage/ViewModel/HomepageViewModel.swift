//
//  HomepageViewModel.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Combine

class HomepageViewModel: ObservableObject {
    
    @Published var news: [NewsModel] = []
    @Published var topHeadlineNews: [NewsModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables: Set<AnyCancellable> = []
    private let getNewsUseCase = GetNewsUseCase()
    private let getTopHeadlineUseCase = GetTopHeadlineUseCase()
    
    func fetchNews() {
        isLoading = true
        getNewsUseCase.execute(params: GetNewsUseCase.Param())
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { news in
                self.news = news
            })
            .store(in: &cancellables)
    }
    
    func getTopHeadlines() {
        isLoading = true
        getTopHeadlineUseCase.execute(params: GetTopHeadlineUseCase.Params())
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { news in
                self.topHeadlineNews = news
            }
            .store(in: &cancellables)
    }
    
    func formattedDate(from dateString: String) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            return date.toFormattedString()
        }
        return nil
    }
}
