//
//  NewsListView.swift
//  NewsListView
//
//  Created by SEAN BLAKE on 9/5/21.
//

import SwiftUI

struct NewsListView: View {
    let articles: [ArticleViewModel]
    var body: some View {
        List(articles) { article in
            VStack(alignment: .leading) {
                Group {
                    Text(article.source).fontWeight(.bold)
                    Text(article.author)
                    Text(article.date)
                }
                .font(.caption)
                Text(article.title).fontWeight(.bold)
                Text(article.description)
                    .foregroundColor(Color.secondary)
                HStack {
                    Spacer()
                    Link(destination: article.url, label: {
                        Image(systemName: "globe")
                            .font(.system(size: 36))
                            .foregroundColor(.orange)
                            .overlay(
                                Image(systemName: "link")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .padding(1)
                                    .background(Circle()
                                                    .fill(Color(.secondarySystemBackground))
                                                    .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 2)
                                               )
                                    .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 2)
                            )
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                if #available(iOS 15, *) {
                    if article.image != nil {
                        AsyncImage(url: article.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }

                    }
                }
                if let image = article.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

