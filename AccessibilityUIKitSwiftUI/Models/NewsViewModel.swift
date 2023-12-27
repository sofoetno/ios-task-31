//
//  NewsViewModel.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 27.12.23.
//


import Foundation
import SwiftUI
import NetworkService

class NewsViewModel: ObservableObject {
    private let url: String = "https://newsapi.org/v2/top-headlines?country=us&apiKey=91d2024d40254c13af54124933070589"
    @Published var news: [NewsModel] = []
    
    init() {
        getData()
    }
    
    func getData() {
        Task {
            do {
                if let response: NewsResponseModel = try await NetworkService.shared.getData(fromUrl: url) {
                    await MainActor.run {
                        news = response.articles
                    }
                }
            } catch {
                print (error)
            }
            
        }
    }
}

