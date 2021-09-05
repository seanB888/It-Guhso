//
//  NewsViewModel.swift
//  NewsViewModel
//
//  Created by SEAN BLAKE on 9/4/21.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [ArticleViewModel] = []
    @Published var country = Country.country(code: Constants.country)
    @Published var isLoading = false
    
    var countryEndPoint: String {
        Constants.baseURL + "?country=" + country.code + "&apiKey=" + Constants.APIKEY
    }
    func getNews() {
        isLoading = true
        if #available(iOS 15, *) {
            Task.init {
                do {
                    let news: News = try await APIService.shared.getJSON(urlString: countryEndPoint, dateDecodingStrategy: .iso8601)
                    articles = news.articles.map(ArticleViewModel.init)
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                    isLoading = false
                }
            }
        }
        APIService.shared.getJSON(urlString: countryEndPoint, dateDecodingStrategy: .iso8601) {
            (result: Result<News, APIService.APIError>) in
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    self.articles = news.articles.map(ArticleViewModel.init)
                    self.isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
