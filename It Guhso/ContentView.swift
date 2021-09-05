//
//  ContentView.swift
//  It Guhso
//
//  Created by SEAN BLAKE on 9/4/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if #available(iOS 15, *) {
                    NewsListView(articles: viewModel.articles)
                        .task {
                            viewModel.getNews()
                        }
                } else {
                    NewsListView(articles: viewModel.articles)
                    .onAppear {
                        viewModel.getNews()
                    }
                }
                if viewModel.isLoading {
                    ProgressView("Fetching The News")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                        .shadow(radius: 10)
                }
            }
            .navigationTitle("It Guhso")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
