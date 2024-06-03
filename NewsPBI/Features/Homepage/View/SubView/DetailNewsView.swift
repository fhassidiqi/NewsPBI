//
//  DetailNewsView.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

struct DetailNewsView: View {
    
    let news: NewsModel
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        ZStack {
            Color.background.primary
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    AsyncImage(url: URL(string: news.urlToImage)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity)
                        case .empty, .failure(_):
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    Text(news.title)
                        .font(.headline)
                        .foregroundStyle(Color.text.primary)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text(news.author)
                            .padding(.trailing)
                        
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        if let formattedDate = viewModel.formattedDate(from: news.publishedAt) {
                            Text(formattedDate)
                        } else {
                            Text("Unknown Date")
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(Color.text.primary)
                    
                    Text(news.content)
                        .font(.callout)
                }
            }
            .padding()
        }
        .toolbar {
            CustomToolbar(title: "Detail News", leadingTitle: "Mandiri News", leadingAction: {
                router.navigateBack()
            })
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color.background.base, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
