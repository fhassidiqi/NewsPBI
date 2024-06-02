//
//  Router.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

@MainActor
final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func navigateToDetailNews(news: NewsModel) {
        navPath.append(news)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
