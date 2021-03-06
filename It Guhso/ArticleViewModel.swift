//
//  ArticleViewModel.swift
//  ArticleViewModel
//
//  Created by SEAN BLAKE on 9/4/21.
//

import Foundation
import UIKit

struct ArticleViewModel: Identifiable {
    let article: News.Article
    init(article: News.Article) {
        self.article = article
    }
    
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MM, d"
        return dateFormatter
    }
    
    let id = UUID()
    var author: String {
        article.author?.withoutHtmlTags ?? ""
    }
    var url: URL {
        article.url
    }
    var source: String {
        article.source.name.withoutHtmlTags
    }
    var title: String {
        article.title.withoutHtmlTags
    }
    var description: String {
        article.description?.withoutHtmlTags ?? ""
    }
    var imageURL: URL? {
        article.urlToImage
    }
    var image: UIImage? {
        guard let imageURL = article.urlToImage else { return nil }
        guard let data = try? Data(contentsOf: imageURL) else { return nil }
        guard let image: UIImage = UIImage(data: data) else { return nil }
        return image
    }
    var date: String {
        Self.dateFormatter.string(from: article.publishedAt)
    }
}
