//
//  NewsCardView.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import SwiftUI

struct NewsCardView: View {
    
    let news: NewsModel
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: news.urlToImage)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .frame(width: 100)
                case .empty, .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .frame(width: 100)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(news.author)
                    
                    Spacer()
                    
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
            }
        }
        .padding(8)
        .background(Color.background.base)
        .cornerRadius(12)
        .onTapGesture {
            router.navigateToDetailNews(news: news)
        }
    }
}
