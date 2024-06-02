//
//  HomepageView.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

struct HomepageView: View {
    
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.primary
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Berita Terkini")
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 16) {
                                if viewModel.isLoading {
                                    ForEach(viewModel.topHeadlineNews.indices, id: \.self) { _ in
                                        Rectangle()
                                            .frame(width: 300, height: 200)
                                            .foregroundStyle(Color.black.opacity(0.2))
                                            .cornerRadius(8)
                                            .shimmer()
                                    }
                                } else {
                                    ForEach(viewModel.topHeadlineNews, id: \.self) { news in
                                        TopHeadlineCardView(news: news)
                                            .frame(width: 300)
                                            .padding(.horizontal, 8)
                                    }
                                }
                            }
                        }
                        
                        Text("Semua Berita")
                        
                        VStack(spacing: 8) {
                            if viewModel.isLoading {
                                ForEach(viewModel.news.indices, id: \.self) { _ in
                                    Rectangle()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .foregroundStyle(Color.black.opacity(0.2))
                                        .cornerRadius(8)
                                        .shimmer()
                                }
                            } else {
                                ForEach(viewModel.news, id: \.self) { news in
                                    NewsCardView(news: news)
                                }
                            }
                        }
                    }
                    .font(.title3).bold()
                    .foregroundStyle(Color.text.primary)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Mandiri News")
            .onAppear {
                viewModel.fetchNews()
                viewModel.getTopHeadlines()
            }
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
