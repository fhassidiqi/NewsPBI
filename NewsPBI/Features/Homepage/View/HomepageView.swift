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
                            HStack{
                                ForEach(viewModel.topHeadlineNews, id: \.self) { news in
                                    TopHeadlineCardView(news: news)
                                        .frame(width: 300)
                                        .padding(.horizontal, 8)
                                }
                            }
                        }
                        
                        Text("Semua Berita")
                        
                        VStack(spacing: 8) {
                            ForEach(viewModel.news, id: \.self) { news in
                                NewsCardView(news: news)
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

#Preview {
    HomepageView()
}
