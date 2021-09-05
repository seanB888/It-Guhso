//
//  ContentView.swift
//  It Guhso
//
//  Created by SEAN BLAKE on 9/4/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    @State private var changeCountry = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if !viewModel.isLoading {
                        HStack{
                            Text("\(viewModel.country.flag) \(viewModel.country.name)")
                                .font(.title)
                            Spacer()
                            Button {
                                changeCountry = true
                            } label: {
                                Text("Chane Country")
                            }
                        }
                        .padding(.horizontal)
                    }
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
                }
                .sheet(isPresented: $changeCountry) {
                    viewModel.articles = []
                    viewModel.getNews()
                } content: {
                    CountryListView(country: $viewModel.country)
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
