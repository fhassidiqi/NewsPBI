//
//  NewsPBIApp.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

@main
struct NewsPBIApp: App {
    
    @ObservedObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomepageView()
                    .navigationDestination(for: NewsModel.self) { news in
                        DetailNewsView(news: news)
                    }
            }
            .environmentObject(router)
        }
    }
}
