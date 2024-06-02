//
//  TopHeadlineCardView.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

struct TopHeadlineCardView: View {
    
    let news: NewsModel
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: news.urlToImage)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .frame(width: 300)
                case .empty, .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .frame(width: 300, height: 180)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(news.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundStyle(Color.text.primary)
            
            Spacer()
            
            HStack {
                Text(news.author)
                
                Spacer()
                
                if let formattedDate = viewModel.formattedDate(from: news.publishedAt) {
                    Text(formattedDate)
                } else {
                    Text("Unknown Date")
                }
            }
            .font(.subheadline)
            .foregroundStyle(Color.text.primary.opacity(0.8))
        }
        .padding(8)
        .background(Color.background.base)
        .cornerRadius(12)
        .onTapGesture {
            router.navigateToDetailNews(news: news)
        }
    }
}
